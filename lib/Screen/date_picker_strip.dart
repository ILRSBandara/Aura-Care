import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DatePickerStrip extends StatelessWidget {
  const DatePickerStrip({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime today = DateTime.now();
    
    // Create a list of dates for this week (Monday to Sunday)
    List<DateTime> weekDays = List.generate(7, (index) {
      return today.subtract(Duration(days: today.weekday - 1)).add(Duration(days: index));
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month Title (March 2025)
          Text(
            'April 2025',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 8),
          // Horizontal list of days of the week
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: weekDays.map((date) {
                bool isSelected = date.day == today.day;  // Highlight the current day
                return GestureDetector(
                  onTap: () {
                    // Handle date selection if necessary
                    if (kDebugMode) {
                      print('Selected Date: ${date.toLocal()}');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade700 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][date.weekday - 1],  // Display day name
                          style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${date.day}',  // Display day of the month
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
