import 'package:aura_care/Screen/DailyCalorieCalculator.dart';
import 'package:aura_care/Screen/mealCard.dart';
import 'package:flutter/material.dart';
import 'build_meal.dart'; // Import your BuildMealScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Meal Plan")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                MealCard(
                  mealName: "Oatmeal with Fruits",
                  mealTime: "08:00 AM",
                  calories: 350,
                  imageUrl: "https://via.placeholder.com/100",
                ),
                MealCard(
                  mealName: "Grilled Chicken Salad",
                  mealTime: "12:30 PM",
                  calories: 500,
                  imageUrl: "https://via.placeholder.com/100",
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(
          //     16.0,
          //   ),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder:
          //               (
          //                 context,
          //               ) =>
          //                   const BuildMealScreen(),
          //         ),
          //       );
          //     },
          //     child: const Text(
          //       "Create Your Meal",
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DailyCalorieCalculator(),
                  ),
                );
              },
              child: const Text("Create Your Meal"),
            ),
          ),
        ],
      ),
    );
  }
}
