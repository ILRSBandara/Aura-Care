import 'package:aura_care/Screen/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen
    extends
        StatefulWidget {
  final String
  emaill;
  const DashboardScreen({
    super.key,
    required this.emaill,
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

  late List<
    Widget
  >
  _pages;

  @override
  void
  initState() {
    super
        .initState();
    _pages = <
      Widget
    >[
      Center(
        child: Text(
          'Home Page',
        ),
      ), // index 0
      Menu(
        email:
            widget.emaill,
      ),
      Center(
        child: Text(
          'Chatbot',
        ),
      ),
      Center(
        child: Text(
          'Profile',
        ),
      ),
    ];
  }

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
            Colors.green,
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
