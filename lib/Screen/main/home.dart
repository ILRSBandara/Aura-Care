import 'package:aura_care/Screen/bmiTracker.dart';
import 'package:aura_care/Screen/doctor_gallery/doctorList.dart';
import 'package:aura_care/Screen/authentication/signIn.dart';
import 'package:aura_care/Screen/fitness_courses/fitnessCourses.dart';
import 'package:aura_care/Screen/helpFinder.dart';
import 'package:aura_care/Screen/main/menu.dart';
import 'package:aura_care/Screen/meal_planner/DailyCalorieCalculator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String email;

  const Home({super.key, required this.email});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              children: [
                Text(
                  'Aura',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'Care',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.menu, size: 24),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ],
      ),

      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyCalorieCalculator(),
                    ),
                  );
                });
              },
              title: Text('Meal Planner'),
              leading: Icon(Icons.fastfood),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FitnessCourses()),
                  );
                });
              },
              title: Text('Fitness Courses'),
              leading: Icon(Icons.fitness_center),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BMIScreen()),
                  );
                });
              },
              title: Text('BMI Calculator'),
              leading: Icon(Icons.monitor_weight_outlined),
            ),

            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorListScreen()),
                  );
                });
              },
              title: Text('Doctor Gallery'),
              leading: Icon(Icons.medical_services),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              EmergencyNumbersScreen(helpEmail: widget.email),
                    ),
                  );
                });
              },
              title: Text('Help Finder'),
              leading: Icon(Icons.call),
            ),

            ListTile(
              onTap: () {},
              title: Text('Health Tracker'),
              leading: Icon(Icons.health_and_safety),
            ),
            Divider(),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                });
              },
              title: Text('Log out'),
              leading: Icon(Icons.transit_enterexit),
            ),
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          Flexible(child: Menu(email: widget.hashCode.toString())),
        ],
      ),
    );
  }
}
