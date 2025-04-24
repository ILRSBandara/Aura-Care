import 'package:flutter/material.dart';

class DatePickerStrip extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime>? onDateSelected;

  const DatePickerStrip({
    super.key,
    required this.initialDate,
    this.onDateSelected,
  });

  @override
  State<DatePickerStrip> createState() => _DatePickerStripState();
}

class _DatePickerStripState extends State<DatePickerStrip> {
  late DateTime selectedDate;
  late List<DateTime> weekDates;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    weekDates = _getCurrentWeekDates(selectedDate);
  }

  List<DateTime> _getCurrentWeekDates(DateTime referenceDate) {
    final int weekday = referenceDate.weekday;
    final DateTime firstDay = referenceDate.subtract(Duration(days: weekday - 1));
    return List.generate(7, (i) => firstDay.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final String currentMonth = DateFormat.yMMMM().format(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Month Name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(currentMonth, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),

        // Week Dates
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weekDates.length,
            itemBuilder: (context, index) {
              final date = weekDates[index];
              final isSelected = date.day == selectedDate.day && date.month == selectedDate.month;

              return GestureDetector(
                onTap: () {
                  setState(() => selectedDate = date);
                  widget.onDateSelected?.call(date);
                },
                child: Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blueAccent : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat.E().format(date), style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white : Colors.grey[600],
                      )),
                      const SizedBox(height: 4),
                      Text('${date.day}', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DateFormat {
  static yMMMM() {}
  
  static E() {}
}
