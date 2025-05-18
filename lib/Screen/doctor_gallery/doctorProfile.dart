import 'package:aura_care/Screen/doctor_gallery/doctorList.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctor.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(doctor.imageAssetPath),
              ),
              SizedBox(height: 16),
              Text(
                doctor.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(doctor.specialty, style: TextStyle(fontSize: 18)),
              SizedBox(height: 25),
              Text(
                'About Doctor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                ' doctor of medicine (M.D.) or doctor of osteopathic medicine (D.O.) — who specializes in mental health. This type of doctor may further specialize in areas such as child and adolescent, geriatric, or addiction psychiatry.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 50),
              Text(
                '- Working Time: Sat - Sun (08:30 AM - 09:00 PM)\n\n- Telephone: +11 20 7407 3100\n\n- Email: Doctor@gmail.com\n\n- Clinic Location: Aurora Family Medical Practice, Battaramulla\n\n- Address:  422/9 Overn Gunawardena Mawatha, Sri Jayawardenepura Kotte',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
