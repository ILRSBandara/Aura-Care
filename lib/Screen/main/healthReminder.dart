import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HealthReminder extends StatefulWidget {
  final String userEmail;

  const HealthReminder({super.key, required this.userEmail});

  @override
  _HealthReminderState createState() => _HealthReminderState();
}

class _HealthReminderState extends State<HealthReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Health Reminders')),
      body: StreamBuilder<List<ReminderItem>>(
        stream: reminderStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No reminders found'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _showAddReminderDialog(context),
                    child: Text('Add First Reminder'),
                  ),
                ],
              ),
            );
          }

          final reminders = snapshot.data!;
          final todayReminders = reminders.where((r) => r.isToday).toList();
          final upcomingReminders = reminders.where((r) => !r.isToday).toList();

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Today\'s Reminders'),
                if (todayReminders.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text('No reminders for today')),
                  ),
                ...todayReminders.map(_buildReminderCard),
                SizedBox(height: 20),
                _buildSectionTitle('Upcoming Reminders'),
                if (upcomingReminders.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text('No upcoming reminders')),
                  )
                else
                  ..._groupRemindersByDate(upcomingReminders).entries.expand((
                    entry,
                  ) {
                    return [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ...entry.value.map(_buildReminderCard),
                    ];
                  }),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _showAddReminderDialog(context),
                    child: Text('Add New Reminder'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Stream<List<ReminderItem>> reminderStream() {
    return FirebaseFirestore.instance
        .collection('user_reminders')
        .doc(widget.userEmail)
        .collection('reminders')
        .orderBy('title')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) {
                final data = doc.data();
                return ReminderItem(
                  title: data['title'] ?? '',
                  time: data['time'] ?? '',
                  icon: IconData(
                    data['iconCodePoint'] ?? Icons.notifications.codePoint,
                    fontFamily: data['iconFontFamily'] ?? 'MaterialIcons',
                    fontPackage: data['iconFontPackage'],
                  ),
                  color: Color(data['colorValue'] ?? Colors.blue.value),
                  isToday: data['isToday'] ?? true,
                  isActive: data['isActive'] ?? true,
                );
              }).toList(),
        );
  }

  Map<String, List<ReminderItem>> _groupRemindersByDate(
    List<ReminderItem> reminders,
  ) {
    Map<String, List<ReminderItem>> grouped = {};

    for (var reminder in reminders) {
      String dateLabel = reminder.time.split(',').first.trim();

      if (!grouped.containsKey(dateLabel)) {
        grouped[dateLabel] = [];
      }

      grouped[dateLabel]!.add(reminder);
    }

    return grouped;
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildReminderCard(ReminderItem reminder) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: reminder.color.withOpacity(0.2),
          child: Icon(reminder.icon, color: reminder.color),
        ),
        title: Text(
          reminder.title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(reminder.time),
        trailing: Switch(
          value: reminder.isActive,
          onChanged: (value) async {
            final userRemindersRef = FirebaseFirestore.instance
                .collection('user_reminders')
                .doc(widget.userEmail)
                .collection('reminders');

            final query =
                await userRemindersRef
                    .where('title', isEqualTo: reminder.title)
                    .where('time', isEqualTo: reminder.time)
                    .get();

            if (query.docs.isNotEmpty) {
              final docId = query.docs.first.id;
              if (value) {
                await userRemindersRef.doc(docId).update({'isActive': true});
              } else {
                await userRemindersRef.doc(docId).delete();
              }
            }
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    final titleController = TextEditingController();
    TimeOfDay selectedTime = TimeOfDay.now();
    DateTime selectedDate = DateTime.now();
    bool isToday = true;
    IconData selectedIcon = Icons.notifications;
    Color selectedColor = Colors.blue;

    final List<IconData> availableIcons = [
      Icons.notifications,
      Icons.medication,
      Icons.local_drink,
      Icons.directions_walk,
      Icons.medical_services,
      Icons.favorite,
      Icons.restaurant,
      Icons.fitness_center,
      Icons.bedtime,
      Icons.monitor_weight,
    ];

    final List<Color> availableColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.pink,
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add New Reminder'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Reminder Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Text('Date'),
                      subtitle: Text(
                        DateFormat('MMM dd, yyyy').format(selectedDate),
                      ),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                            isToday =
                                picked.difference(DateTime.now()).inDays == 0;
                          });
                        }
                      },
                    ),
                    ListTile(
                      title: Text('Time'),
                      subtitle: Text(selectedTime.format(context)),
                      trailing: Icon(Icons.access_time),
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null) {
                          setState(() {
                            selectedTime = picked;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Select Icon', style: TextStyle(fontSize: 16)),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          availableIcons.map((icon) {
                            return GestureDetector(
                              onTap: () => setState(() => selectedIcon = icon),
                              child: CircleAvatar(
                                backgroundColor:
                                    selectedIcon == icon
                                        ? selectedColor
                                        : Colors.grey[300],
                                child: Icon(
                                  icon,
                                  color:
                                      selectedIcon == icon
                                          ? Colors.white
                                          : Colors.grey[700],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text('Select Color', style: TextStyle(fontSize: 16)),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          availableColors.map((color) {
                            return GestureDetector(
                              onTap:
                                  () => setState(() => selectedColor = color),
                              child: CircleAvatar(
                                backgroundColor: color,
                                child:
                                    selectedColor == color
                                        ? Icon(Icons.check, color: Colors.white)
                                        : null,
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter a title for the reminder',
                          ),
                        ),
                      );
                      return;
                    }

                    final timeString =
                        isToday
                            ? selectedTime.format(context)
                            : '${DateFormat('MMM dd').format(selectedDate)}, ${selectedTime.format(context)}';

                    final userRemindersRef = FirebaseFirestore.instance
                        .collection('user_reminders')
                        .doc(widget.userEmail)
                        .collection('reminders');

                    await userRemindersRef.add({
                      'title': titleController.text,
                      'time': timeString,
                      'iconCodePoint': selectedIcon.codePoint,
                      'iconFontFamily': selectedIcon.fontFamily,
                      'iconFontPackage': selectedIcon.fontPackage,
                      'colorValue': selectedColor.value,
                      'isToday': isToday,
                      'isActive': true,
                      'createdAt': DateTime.now(),
                    });

                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class ReminderItem {
  final String title;
  final String time;
  final IconData icon;
  final Color color;
  final bool isToday;
  final bool isActive;

  ReminderItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
    required this.isToday,
    required this.isActive,
  });
}
