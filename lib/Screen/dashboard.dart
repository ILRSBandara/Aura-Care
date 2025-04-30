import 'package:aura_care/Screen/daily_check_In_screen.dart';
import 'package:aura_care/Screen/gemini_ai.dart';
import 'package:flutter/material.dart';
import 'bmi.dart';             // your existing BMI screen
import 'doctor_list.dart';    // import your doctor_list.dart

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // center vertically
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BMIScreen()),
                );
              },
              child: const Text('Open BMI Calculator'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HealthDataScreen()),
                );
              },
              child: const Text('Health Data'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DoctorListScreen()),
                );
              },
              child: const Text('Doctor Details'),
            ),
            const SizedBox(height: 16),

            // 🔥 New Button for DailyCheckInScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DailyCheckInScreen()),
                );
              },
              child: const Text('Daily Check-in Screen'),
            ),
            const SizedBox(height: 16),

            // 👇 New Button for AI-Chatbot
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GeminiChatBot()),
                );
              },
              child: const Text('AI-Chatbot'),
            ),
          ],
        ),
      ),
    );
  }
}


// -----------------------------
// Your Health Data Screen (Simple One)
class HealthDataScreen extends StatelessWidget {
  const HealthDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data'),
      ),
      body: const Center(
        child: Text('Health Data Screen Content'),
      ),
    );
  }
}
