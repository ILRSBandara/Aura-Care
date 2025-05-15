import 'dart:math';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
// ignore: depend_on_referenced_packages
import 'package:swipeable_button_view/swipeable_button_view.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_gauge/pretty_gauge.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: BMIScreen()),
  );
}

///
/// BMIScreen: The main screen for BMI calculation.
///
class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              const Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/Images/bmi.png', // make sure this asset exists in your project
                  width: 180,
                ),
              ),
              const SizedBox(height: 20),
              // Height selector
              Height(
                onChange: (heightVal) {
                  _height = heightVal;
                },
              ),
              const SizedBox(height: 15),
              // Age and Weight selectors side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AgeWeight(
                    onChange: (ageVal) {
                      _age = ageVal;
                    },
                    title: "Age",
                    initValue: 30,
                    min: 0,
                    max: 100,
                  ),
                  const SizedBox(width: 15),
                  AgeWeight(
                    onChange: (weightVal) {
                      _weight = weightVal;
                    },
                    title: "Weight",
                    initValue: 50,
                    min: 0,
                    max: 200,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Swipeable Button to calculate BMI
              SwipeableButtonView(
                isFinished: _isFinished,
                onFinish: () async {
                  // Navigate to Score Screen after calculating BMI.
                  await Navigator.push(
                    context,
                    PageTransition(
                      child: ScoreScreen(bmiScore: _bmiScore, age: _age),
                      type: PageTransitionType.fade,
                    ),
                  );
                  setState(() {
                    _isFinished = false;
                  });
                },
                onWaitingProcess: () {
                  // Calculate BMI when waiting.
                  calculateBmi();

                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      _isFinished = true;
                    });
                  });
                },
                activeColor: Colors.blue,
                buttonWidget: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
                buttonText: "CALCULATE",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    // BMI = weight (kg) / [height (m)]²
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}

///
/// AgeWeight widget: A counter widget used for both Age and Weight.
///
class AgeWeight extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeight({
    super.key,
    required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AgeWeightState createState() => _AgeWeightState();
}

class _AgeWeightState extends State<AgeWeight> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                  const SizedBox(width: 15),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// Height widget: Displays a slider for selecting height.
///
class Height extends StatefulWidget {
  final Function(int) onChange;

  const Height({super.key, required this.onChange});

  @override
  // ignore: library_private_types_in_public_api
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              "Height",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_height.toString(), style: const TextStyle(fontSize: 30)),
                const SizedBox(width: 10),
                const Text(
                  "cm",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              value: _height.toDouble(),
              thumbColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

///
/// ScoreScreen: Displays the BMI score along with an interpretation.
///
class ScoreScreen extends StatefulWidget {
  final double bmiScore;
  final int age;

  const ScoreScreen({super.key, required this.bmiScore, required this.age});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  @override
  void initState() {
    super.initState();
    setBmiInterpretation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            const Text(
              "Your Score",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            PrettyGauge(
              gaugeSize: 310,
              minValue: 0,
              maxValue: 40,
              segments: [
                GaugeSegment('UnderWeight', 18.5, Colors.red),
                GaugeSegment('Normal', 6.4, Colors.blue),
                GaugeSegment('OverWeight', 5, Colors.orange),
                GaugeSegment('Obese', 10.1, Colors.pink),
              ],
              valueWidget: Text(
                widget.bmiScore.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40),
              ),
              currentValue: widget.bmiScore,
              needleColor: Colors.blue,
            ),
            Text(
              bmiStatus!,
              style: TextStyle(fontSize: 50, color: bmiStatusColor!),
            ),
            const SizedBox(height: 10),
            Text(bmiInterpretation!, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 114, 213, 200),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Re-calculate"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (widget.bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (widget.bmiScore >= 18.5) {
      bmiStatus = "NORMAL";
      bmiInterpretation = "Have fun you are in great shape!";
      bmiStatusColor = Colors.blue;
    } else if (widget.bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
