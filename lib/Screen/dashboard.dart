import 'package:aura_care/Screen/bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen
    extends
        StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<
    DashboardScreen
  >
  createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends
        State<
          DashboardScreen
        > {
  int
  _selectedIndex =
      0;

  final List<
    Widget
  >
  _pages = <
    Widget
  >[
    Center(
      child: Text(
        'Home Page',
      ),
    ), // index 0
    Center(
      child: Text(
        'Menu Page',
      ),
    ), // index 1
    Center(
      child: Text(
        'Chatbot',
      ),
    ),
    BMIScreen(),
  ];

  void
  _onItemTapped(
    int
    index,
  ) {
    setState(() {
      _selectedIndex =
          index;
    });
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body:
          _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex,
        onTap:
            _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:
                'Home',
            backgroundColor:
                Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label:
                'Menu',
            backgroundColor:
                Colors.white,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.robot,
              size:
                  23.0,
            ),
            label:
                'Chatbot',
            backgroundColor:
                Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
            ),
            label:
                'Profile',
            backgroundColor:
                Colors.white,
          ),
        ],
        unselectedItemColor:
            Colors.grey,
        selectedItemColor:
            Colors.black,
        showSelectedLabels:
            true,
        showUnselectedLabels:
            true,
        selectedLabelStyle: TextStyle(
          fontSize:
              12,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize:
              12,
        ),
        type:
            BottomNavigationBarType.fixed,
      ),
    );
  }
}
