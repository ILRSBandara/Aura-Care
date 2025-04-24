import 'package:aura_care/Screen/date_picker_strip.dart';
import 'package:flutter/material.dart';
// Ensure this import points to the correct file

import 'weekly_calories_chart.dart';

// MODEL
class HealthData {
  final double sleepHours;
  final double calorieIntake;
  final int steps;

  HealthData({required this.sleepHours, required this.calorieIntake, required this.steps});
}

class HealthDataBody extends StatefulWidget {
  const HealthDataBody({super.key});

  @override
  State<HealthDataBody> createState() => _HealthDataBodyState();
}

class _HealthDataBodyState extends State<HealthDataBody> {
  DateTime selectedDate = DateTime.now();

  final Map<String, HealthData> weeklyHealth = {
    'Mon': HealthData(sleepHours: 6.2, calorieIntake: 900, steps: 2400),
    'Tue': HealthData(sleepHours: 5.5, calorieIntake: 1020, steps: 3000),
    'Wed': HealthData(sleepHours: 6.08, calorieIntake: 1050, steps: 2015),
    'Thu': HealthData(sleepHours: 7.0, calorieIntake: 1200, steps: 3200),
    'Fri': HealthData(sleepHours: 6.5, calorieIntake: 950, steps: 5000),
    'Sat': HealthData(sleepHours: 8.0, calorieIntake: 1100, steps: 6200),
    'Sun': HealthData(sleepHours: 7.2, calorieIntake: 980, steps: 4500),
  };

  @override
  Widget build(BuildContext context) {
    String selectedDay = _getWeekdayString(selectedDate);
    final currentData = weeklyHealth[selectedDay]!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Custom calendar strip
          DatePickerStrip(
            initialDate: selectedDate,
            onDateSelected: (date) {
              setState(() => selectedDate = date);
            },
          ),

          const OverviewCards(),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Daily progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Ensure the DailyProgress widget is defined or imported correctly
          DailyProgress(data: currentData), // Define or import this widget

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Calories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownIndicator(options: ['Weekly', 'Monthly'], selected: 'Weekly'),
              ],
            ),
          ),

          WeeklyCaloriesChart(healthData: weeklyHealth),
        ],
      ),
    );
  }

  // Converts DateTime to short weekday (e.g. Mon, Tue)
  String _getWeekdayString(DateTime date) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[date.weekday - 1];
  }
  
  // ignore: non_constant_identifier_names
  DropdownIndicator({required List<String> options, required String selected}) {}
}

class DailyProgress extends StatelessWidget {
  final HealthData data;

  const DailyProgress({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Steps: ${data.steps}', style: const TextStyle(fontSize: 16)),
            Text('Sleep Hours: ${data.sleepHours}', style: const TextStyle(fontSize: 16)),
            Text('Calorie Intake: ${data.calorieIntake}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class OverviewCards extends StatelessWidget {
  const OverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Details about health data go here.'),
          ],
        ),
      ),
    );
  }
}
