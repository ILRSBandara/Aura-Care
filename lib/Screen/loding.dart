import 'dart:async';
import 'package:aura_care/Screen/authentication/signIn.dart';
import 'package:flutter/material.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({super.key});

  @override
  _LodingScreenState createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      if (_progress >= 1) {
        timer.cancel();
        _navigateToHome();
      } else {
        setState(() {
          _progress += 0.2;
        });
      }
    });
  }

  _navigateToHome() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 75),
                      child: Image.asset(
                        'assets/Images/auraCareMainLogo.png',
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90, right: 90),
                    child: const CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 5,
                    ),
                  ),
                  const SizedBox(height: 75),

                  Text(
                    'From',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aura',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Care',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
