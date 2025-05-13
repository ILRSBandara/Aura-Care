// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:aura_care/Screen/bmiTracker.dart';
import 'package:aura_care/Screen/exercise_view_1.dart';
import 'package:flutter/material.dart';

class HomePage2
    extends
        StatelessWidget {
  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      appBar:
          AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                "Fitness Courses",
                style: TextStyle(
                  color:
                      Colors.black,
                  fontWeight:
                      FontWeight.bold,
                  fontSize:
                      25,
                ),
              ),
              const SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            child: Image.asset(
                              "assets/Images/7.png",
                              height:
                                  100,
                              width:
                                  100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Warm Up\n5.00 MIN",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                85.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                                  screen1(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/21.png",
                                height:
                                    200,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Jumping-Jack\n12x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                40,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/10.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Skipping\n15x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                90.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                              child: Image.asset(
                                "assets/Images/8.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Squats\n20x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                100.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/11.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Arm Raises\n1.00 MIN",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                60.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                              child: Image.asset(
                                "assets/Images/2.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Rest and Drink\n5.00 MIN",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                30.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/13.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Incline Push-UPs\n12x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                50.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/12.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Push-Ups\n15x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                109.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/10.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Skipping\n20x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                117.0,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height:
                        100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
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
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.asset(
                                "assets/Images/17.png",
                                height:
                                    100,
                                width:
                                    100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom:
                                25,
                          ),
                          child: Container(
                            child: Text(
                              "Cobra Stretch\n20x",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.black,
                                fontSize:
                                    17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                75,
                            bottom:
                                20,
                          ),
                          child: Image.asset(
                            "assets/Images/4.webp",
                            height:
                                30,
                            width:
                                30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
