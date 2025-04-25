import 'package:flutter/material.dart';
import 'doctor_list.dart';  // Import the Doctor model here.

class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(doctor.imageAssetPath),
            ),
            SizedBox(height: 16),
            Text(
              doctor.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              doctor.specialty,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'About Doctor:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Dr. Bellamy Nicholas is a top specialist at London Bridge Hospital...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Working Time: Mon - Sat (08:30 AM - 09:00 PM)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Book appointment logic here
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
