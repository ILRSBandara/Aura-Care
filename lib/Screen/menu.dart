import 'package:aura_care/Screen/bmi.dart';
import 'package:flutter/material.dart';

class Menu
    extends
        StatefulWidget {
  final String
  email;
  const Menu({
    super.key,
    required this.email,
  });

  @override
  State<
    Menu
  >
  createState() =>
      _MenuState();
}

class _MenuState
    extends
        State<
          Menu
        > {
  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height:
                    40,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left:
                          10,
                    ),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize:
                            25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:
                    10,
              ),
              Container(
                width:
                    double.infinity, // Make the container take full width
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    100,
                    194,
                    255,
                    199,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  border: Border.all(
                    color:
                        Colors.white,
                  ), // Set border color to green
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText:
                        'Search Here',
                    contentPadding: EdgeInsets.only(
                      left:
                          20,
                    ),
                    border:
                        InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.blue[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item 01",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        const BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Track now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/auraCareMainLogo.png',
                          width:
                              75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.orange[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "BMI Tracker",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.orange,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        const BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Track now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/bmi.png',
                          width:
                              75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.green[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item 03",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.green,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        const BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Track now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/auraCareMainLogo.png',
                          width:
                              75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.purple[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item 04",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.purple,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Track now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/auraCareMainLogo.png',
                          width:
                              75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.red[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item 05",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        const BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Track now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/auraCareMainLogo.png',
                          width:
                              75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color:
                      Colors.brown[100],
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name Generator",
                          style: TextStyle(
                            fontSize:
                                18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height:
                              10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<
                              Color
                            >(
                              Colors.brown,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) =>
                                        const BMIScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Generate now',
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize:
                                  12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Images/auraCareMainLogo.png',
                          width:
                              100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
