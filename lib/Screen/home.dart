import 'package:aura_care/Screen/bmi.dart';
import 'package:aura_care/Screen/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage
    extends
        StatefulWidget {
  @override
  _HomePageState
  createState() =>
      _HomePageState();
}

class _HomePageState
    extends
        State<
          HomePage
        > {
  final GlobalKey<
    ScaffoldState
  >
  _scaffoldKey =
      GlobalKey<
        ScaffoldState
      >(); // Control drawer

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      key:
          _scaffoldKey,

      appBar: AppBar(
        automaticallyImplyLeading:
            false,
        elevation:
            0.1,
        backgroundColor:
            Colors.white,
        title: Align(
          alignment:
              Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left:
                  8.0,
            ),
            child: Row(
              children: [
                Text(
                  'Aura',
                  style: TextStyle(
                    fontSize:
                        22,
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
                        22,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right:
                  8.0,
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size:
                    24,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ],
      ),

      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.zero,
        ), // Sharp edges
        child: ListView(
          children: <
            Widget
          >[
            UserAccountsDrawerHeader(
              accountName: Text(
                'abcd',
              ),
              accountEmail: Text(
                'abcd.@gmail.com',
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor:
                      Colors.grey,
                  child: Icon(
                    Icons.person,
                    color:
                        Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color:
                    Colors.green,
                // No borderRadius here
              ),
            ),

            ListTile(
              onTap:
                  () {},
              title: Text(
                'Home',
              ),
              leading: Icon(
                Icons.home,
              ),
            ),
            ListTile(
              onTap:
                  () {},
              title: Text(
                'Menu',
              ),
              leading: Icon(
                Icons.person,
              ),
            ),
            ListTile(
              onTap:
                  () {},
              title: Text(
                'Menu',
              ),
              leading: Icon(
                Icons.menu,
              ),
            ),
            ListTile(
              onTap:
                  () {},
              title: Text(
                'Chatbot',
              ),
              leading: Icon(
                Icons.dashboard,
              ),
            ),
            ListTile(
              onTap:
                  () {},
              title: Text(
                'Profile',
              ),
              leading: Icon(
                Icons.man,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then(
                  (
                    value,
                  ) {
                    Navigator.pushReplacement(
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
                );
              },
              title: Text(
                'Log out',
              ),
              leading: Icon(
                Icons.transit_enterexit,
                color:
                    Colors.grey,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: <
          Widget
        >[
          Flexible(
            child: Menu(
              email:
                  widget.hashCode.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
