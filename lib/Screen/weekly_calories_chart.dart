import 'package:aura_care/Screen/health_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyCaloriesChart extends StatelessWidget {
  const WeeklyCaloriesChart({super.key, required Map<String, HealthData> healthData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                return Text(days[value.toInt()]);
              }),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 500, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 600, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 700, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 800, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 550, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 450, width: 16, color: Colors.blue)]),
            BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 600, width: 16, color: Colors.blue)]),
          ],
        ),
      ),
    );
  }
}
