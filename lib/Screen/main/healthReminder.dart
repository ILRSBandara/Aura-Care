import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this package to your pubspec.yaml

class HealthReminder extends StatefulWidget {
  const HealthReminder({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HealthReminderState createState() => _HealthReminderState();
}

class _HealthReminderState extends State<HealthReminder> {
  // List to store reminders
  List<ReminderItem> reminders = [
    ReminderItem(
      title: 'Take Medication',
      time: '8:00 AM',
      icon: Icons.medication,
      color: Colors.blue,
      isToday: true,
    ),
    ReminderItem(
      title: 'Drink Water',
      time: '10:00 AM',
      icon: Icons.local_drink,
      color: Colors.lightBlue,
      isToday: true,
    ),
    ReminderItem(
      title: 'Take a Walk',
      time: '5:30 PM',
      icon: Icons.directions_walk,
      color: Colors.green,
      isToday: true,
    ),
    ReminderItem(
      title: 'Doctor Appointment',
      time: 'Tomorrow, 2:30 PM',
      icon: Icons.medical_services,
      color: Colors.orange,
      isToday: false,
    ),
    ReminderItem(
      title: 'Blood Pressure Check',
      time: 'May 11, 9:00 AM',
      icon: Icons.favorite,
      color: Colors.red,
      isToday: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Separate today's reminders from upcoming ones
    List<ReminderItem> todayReminders =
        reminders.where((item) => item.isToday).toList();
    List<ReminderItem> upcomingReminders =
        reminders.where((item) => !item.isToday).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Health Reminders')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Reminders Section
            _buildSectionTitle('Today\'s Reminders'),
            if (todayReminders.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: Text('No reminders for today')),
              ),
            ...todayReminders.map((reminder) => _buildReminderCard(reminder)),

            SizedBox(height: 20),

            // Upcoming Reminders Section
            _buildSectionTitle('Upcoming'),
            if (upcomingReminders.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: Text('No upcoming reminders')),
              ),
            ...upcomingReminders.map(
              (reminder) => _buildReminderCard(reminder),
            ),

            SizedBox(height: 20),

            // Add Reminder Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showAddReminderDialog(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 74, 239, 126),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text('Add New Reminder', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
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
          // ignore: deprecated_member_use
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
          onChanged: (value) {
            setState(() {
              reminder.isActive = value;
            });
          },
          activeColor: Colors.blue,
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

    // List of available icons for reminders
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

    // List of available colors for reminders
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

                    // Date selector
                    ListTile(
                      title: Text('Date'),
                      subtitle: Text(
                        DateFormat('MMM dd, yyyy').format(selectedDate),
                      ),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                            isToday =
                                selectedDate.day == DateTime.now().day &&
                                selectedDate.month == DateTime.now().month &&
                                selectedDate.year == DateTime.now().year;
                          });
                        }
                      },
                    ),

                    // Time selector
                    ListTile(
                      title: Text('Time'),
                      subtitle: Text(selectedTime.format(context)),
                      trailing: Icon(Icons.access_time),
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
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

                    // Icon selector
                    Text('Select Icon', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          availableIcons.map((icon) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIcon = icon;
                                });
                              },
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

                    // Color selector
                    Text('Select Color', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          availableColors.map((color) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
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

                    // Format time string
                    String timeString;
                    if (isToday) {
                      timeString = selectedTime.format(context);
                    } else {
                      timeString =
                          '${DateFormat('MMM dd').format(selectedDate)}, ${selectedTime.format(context)}';
                    }

                    // Create new reminder
                    final newReminder = ReminderItem(
                      title: titleController.text,
                      time: timeString,
                      icon: selectedIcon,
                      color: selectedColor,
                      isToday: isToday,
                    );

                    // Add to list and update UI
                    setState(() {
                      this.setState(() {
                        reminders.add(newReminder);
                      });
                    });

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
  bool isActive;

  ReminderItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
    required this.isToday,
    this.isActive = true,
  });
}
