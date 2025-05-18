import 'dart:async';
import 'package:aura_care/Screen/loding.dart';
import 'package:flutter/material.dart';

class SplashScreen
    extends
        StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState
  createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends
        State<
          SplashScreen
        > {
  @override
  void
  initState() {
    super
        .initState();
    Timer(
      const Duration(
        seconds:
            3,
      ),
      () {
        Navigator.of(
          context,
        ).pushReplacement(
          MaterialPageRoute(
            builder:
                (
                  _,
                ) =>
                    LodingScreen(),
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
      body: Stack(
        children: [
          Center(
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
                          100,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/Images/auraCareMainLogo.png',
                        width:
                            100,

                        fit:
                            BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment:
                Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom:
                    30,
              ),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      fontSize:
                          14,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aura',
                        style: TextStyle(
                          fontSize:
                              18,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.green,
                        ),
                      ),
                      Text(
                        'Care',
                        style: TextStyle(
                          fontSize:
                              18,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.black,
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
