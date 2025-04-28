// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DailyCheckInScreenState createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  int waterGlasses = 0;
  String activity = 'None';
  int steps = 0;
  String mood = '';

  final List<String> activities = ['None', 'Walk', 'Run', 'Gym', 'Yoga'];
  final List<String> moods = ['Energetic', 'Normal', 'Tired', 'Sick'];

  void submitCheckIn() {
    print('Water: $waterGlasses glasses');
    print('Activity: $activity');
    print('Steps: $steps');
    print('Mood: $mood');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Daily Check-in Submitted!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Check-in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('💧 How many glasses of water today?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: waterGlasses.toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: '$waterGlasses',
                    onChanged: (value) {
                      setState(() {
                        waterGlasses = value.toInt();
                      });
                    },
                  ),
                ),
                Text('$waterGlasses', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 16),

            Text('🏃 Did you do any activity?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: activity,
              onChanged: (value) {
                setState(() {
                  activity = value!;
                });
              },
              items: activities.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            Text('🚶 Estimated steps walked today?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter number of steps',
              ),
              onChanged: (value) {
                steps = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 16),

            Text('😊 How are you feeling today?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: moods.map((item) {
                return ChoiceChip(
                  label: Text(item),
                  selected: mood == item,
                  onSelected: (_) {
                    setState(() {
                      mood = item;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            ElevatedButton(
              onPressed: submitCheckIn,
              // ignore: sort_child_properties_last
              child: Text('Submit Check-in'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
