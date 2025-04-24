// lib/screens/dashboard.dart

import 'package:flutter/material.dart';
import 'bmi.dart';            // your existing BMI screen
// new Health Data screen (create this)

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
          mainAxisSize: MainAxisSize.min,       // center vertically
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
            const SizedBox(height: 16),          // spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HealthDataScreen()),
                );
              },
              child: const Text('Health Data'),
            ),
          ],
        ),
      ),
    );
  }
}

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
