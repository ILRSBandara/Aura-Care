// lib/screens/bmi.dart
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String _selectedGender = 'female'; // or 'male'
  double _heightCm = 150.0;
  int _weight = 55;
  int _age = 28;
  double _bmiResult = 0.0;

  // Function to calculate BMI
  void _calculateBMI() {
    final double heightInMeters = _heightCm / 100;
    final double bmi = _weight / (heightInMeters * heightInMeters);
    setState(() {
      _bmiResult = bmi;
    });
  }

  // Optional: Classify BMI (example ranges)
  String _classifyBMI(double bmi) {
    if (bmi == 0) return '';
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    final String bmiStatus = _classifyBMI(_bmiResult);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // GENDER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Images/bmi.png',
                   width: 180,
                ),
                //_genderCard('female', Icons.female),
                //const SizedBox(width: 16),
                //_genderCard('male', Icons.male),
              ],
            ),

            const SizedBox(height: 24),

            // HEIGHT
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Height (cm)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_heightCm.toStringAsFixed(0)} cm',
                      style: const TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Slider(
                      value: _heightCm,
                      min: 100,
                      max: 220,
                      activeColor: Colors.green,
                      inactiveColor: Colors.greenAccent,
                      onChanged: (double newVal) {
                        setState(() {
                          _heightCm = newVal;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // WEIGHT & AGE
            Row(
              children: [
                Expanded(
                  child: _incrementCard(
                    label: 'Weight',
                    value: _weight,
                    onDecrement: () {
                      setState(() {
                        if (_weight > 1) _weight--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        _weight++;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _incrementCard(
                    label: 'Age',
                    value: _age,
                    onDecrement: () {
                      setState(() {
                        if (_age > 1) _age--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        _age++;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // CALCULATE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              ),
              onPressed: _calculateBMI,
              child: const Text(
                'CALCULATE',
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 24),

            // SCORE & STATUS
            if (_bmiResult > 0) ...[
              Text(
                'Your Score: ${_bmiResult.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                bmiStatus,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // Recalculate or do something else
                  setState(() {
                    _bmiResult = 0.0; // reset
                  });
                },
                child: const Text('Re-calculate'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget: Gender selection
  Widget _genderCard(String gender, IconData iconData) {
    final bool isSelected = (_selectedGender == gender);
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: Card(
          color: isSelected ? Colors.lightGreen : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Icon(
                  iconData,
                  size: 40,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
                const SizedBox(height: 8),
                Text(
                  gender.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget: Weight/Age increment card
  Widget _incrementCard({
    required String label,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _roundIconButton(Icons.remove, onDecrement),
              const SizedBox(width: 10),
              _roundIconButton(Icons.add, onIncrement),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Widget: Round increment/decrement button
  Widget _roundIconButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
