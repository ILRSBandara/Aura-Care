import 'package:aura_care/Screen/meal_planner/buildMealScreen.dart';
import 'package:flutter/material.dart';

// Model class for Food
class Food {
  final String name;
  final int calories;
  final String category;

  Food({required this.name, required this.calories, required this.category});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const DailyCalorieCalculator(),
    );
  }
}

// Screen 1: Daily Calorie Calculator
class DailyCalorieCalculator extends StatefulWidget {
  const DailyCalorieCalculator({super.key});

  @override
  State<DailyCalorieCalculator> createState() => _DailyCalorieCalculatorState();
}

class _DailyCalorieCalculatorState extends State<DailyCalorieCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _gender = 'Male';
  double dailyCalories = 0.0;

  void calculateDailyCalories() {
    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    int age = int.tryParse(_ageController.text) ?? 0;

    if (height > 0 && weight > 0 && age > 0) {
      double bmr;
      if (_gender == 'Male') {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      } else {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      }
      double tdee = bmr * 1.2;

      setState(() {
        dailyCalories = tdee;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Calorie Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(_heightController, "Height (cm)", Icons.height),
            const SizedBox(height: 10),
            buildTextField(
              _weightController,
              "Weight (kg)",
              Icons.monitor_weight,
            ),
            const SizedBox(height: 10),
            buildTextField(_ageController, "Age (years)", Icons.cake),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _gender,
              decoration: InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items:
                  ['Male', 'Female']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
              onChanged: (val) => setState(() => _gender = val!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateDailyCalories,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (dailyCalories > 0)
              Column(
                children: [
                  Text(
                    "Your daily calorie need: ${dailyCalories.toStringAsFixed(0)} kcal",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  BuildMealScreen(dailyCalories: dailyCalories),
                        ),
                      );
                    },
                    child: const Text('Go to Meal Builder'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color.fromARGB(100, 194, 255, 199),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

