// lib/screens/dashboard.dart

import 'package:flutter/material.dart';
import 'bmi.dart';            // your existing BMI screen
// ignore: unused_import
import 'health_data.dart';   // your existing HealthDataScreen
// You can also import a doctor's screen if you create one later

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
            const SizedBox(height: 16),          // spacing between buttons
            ElevatedButton(
              onPressed: () {
                // You can either navigate to a Doctor's screen or initiate a call.
                // For now, let's print a placeholder message.
                // ignore: avoid_print
                print("Calling the doctor...");
                // You could navigate to a call screen if you have one, e.g.:
                // Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorCallScreen()));
              },
              child: const Text('Doctor Details'),
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
