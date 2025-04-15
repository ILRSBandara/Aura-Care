// lib/screens/dashboard.dart

import 'package:flutter/material.dart';
import 'bmi.dart'; // Make sure this path is correct

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BmiScreen()),
            );
          },
          child: const Text('Open BMI Calculator'),
        ),
      ),
    );
  }
}
