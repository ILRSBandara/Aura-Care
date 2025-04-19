import 'dart:async'; // Import Timer
import 'package:aura_care/Screen/login.dart';
import 'package:flutter/material.dart';

class LodingScreen
    extends
        StatefulWidget {
  const LodingScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LodingScreenState
  createState() =>
      _LodingScreenState();
}

class _LodingScreenState
    extends
        State<
          LodingScreen
        > {
  @override
  void
  initState() {
    super
        .initState();
    // Delay for 3 seconds, then navigate to DashboardScreen
    Timer(
      const Duration(
        seconds:
            3,
      ),
      () {
        // Replace the current screen with DashboardScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (
                  context,
                ) =>
                    const LogIn(),
          ),
        );
      },
    );
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(
                223,
                138,
                221,
                185,
              ),
              const Color.fromARGB(
                224,
                45,
                139,
                108,
              ),
            ],
            begin:
                Alignment.topCenter,
            end:
                Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top:
                  300,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom:
                        105,
                  ),
                  child: Image.asset(
                    'assets/Images/abcd.png',
                    width:
                        770,
                    height:
                        300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal:
                        90,
                  ),
                  child: const CircularProgressIndicator(
                    color:
                        Colors.white,
                    strokeWidth:
                        5,
                  ),
                ),
                const SizedBox(
                  height:
                      10,
                ),
                const Text(
                  'Loading....',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
