import 'package:aura_care/Screen/bmiTracker.dart';
import 'package:aura_care/Screen/doctorList.dart';
import 'package:aura_care/Screen/main/chatBot.dart';
import 'package:aura_care/Screen/login.dart';
import 'package:aura_care/Screen/main/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
            UserAccountsDrawerHeader(
              accountName: Text('abcd'),
              accountEmail: Text('abcd.@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),

            ListTile(
              onTap: () {},
              title: Text('Health Tracker'),
              leading: Icon(Icons.health_and_safety),
            ),
            ListTile(
              onTap: () {},
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
              onTap: () {},
              title: Text('Help Finder'),
              leading: Icon(Icons.call),
            ),
            ListTile(
              onTap: () {},
              title: Text('Meal Planner'),
              leading: Icon(Icons.fastfood),
            ),
            Divider(),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
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
