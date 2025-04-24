// lib/screens/health_data.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package

// If you put the helper widgets in separate files, import them:
// import 'date_picker_strip.dart';
// import 'overview_cards.dart';
// import 'daily_progress.dart';
// import 'weekly_calories_chart.dart';
// import 'bottom_nav_bar.dart';

class HealthDataScreen extends StatelessWidget {
  const HealthDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Statistics'),
        centerTitle: true,
      ),
      body: const HealthDataBody(),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 2),
    );
  }
}

class HealthDataBody extends StatelessWidget {
  const HealthDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // 1. Month & Date strip
          DatePickerStrip(),

          // 2. Overview cards
          OverviewCards(),

          // 3. Section title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Daily progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // 4. Concentric progress rings + legend
          DailyProgress(),

          // 5. Calories header + dropdown
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Calories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownIndicator(options: ['Weekly', 'Monthly'], selected: 'Weekly'),
              ],
            ),
          ),

          // 6. Bar chart
          WeeklyCaloriesChart(),
        ],
      ),
    );
  }
}

/// Stub implementations below — replace with the full versions
class DatePickerStrip extends StatelessWidget {
  const DatePickerStrip({super.key});
  @override
  Widget build(BuildContext c) => const SizedBox(height: 80, child: Center(child: Text('Date Strip')));
}

class OverviewCards extends StatelessWidget {
  const OverviewCards({super.key});
  @override
  Widget build(BuildContext c) => const SizedBox(height: 120, child: Center(child: Text('Overview Cards')));
}

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key});
  @override
  Widget build(BuildContext c) => const SizedBox(height: 200, child: Center(child: Text('Rings & Legend')));
}

class DropdownIndicator extends StatelessWidget {
  final List<String> options;
  final String selected;
  const DropdownIndicator({required this.options, required this.selected, super.key});

  @override
  Widget build(BuildContext c) => DropdownButton<String>(
        value: selected,
        items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
        onChanged: (_) {},
      );
}

class WeeklyCaloriesChart extends StatelessWidget {
  const WeeklyCaloriesChart({super.key});
 @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(toY: 500, width: 16, color: Colors.blue),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(toY: 600, width: 16, color: Colors.blue),
            ]),
            // Add other days of the week here
          ],
        ),
      ),
    );
  }
}

/// Your existing bottom nav bar
class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const MyBottomNavBar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext c) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Doctors'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistics'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (i) {
        // handle navigation…
      },
    );
  }
}
