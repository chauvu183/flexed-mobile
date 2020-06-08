import 'package:flexed_mobile/pages/solTrackingHomepage/solTrackingHomepage.dart';
import 'package:flexed_mobile/pages/widgets/bottom_nav_button.dart';
import 'package:flexed_mobile/pages/widgets/bottom_nav_divider.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreen = SolTrackingHome();
  int _currentTab = 0;

  // Coloring
  Color currentColor = Color(0xFF14BD9C);
  Color mainColor = Colors.black;

  // Callbacks
  callbackCurrentScreen(currentScreen, currentTab) {
    setState(() {
      _currentScreen = currentScreen;
      _currentTab = currentTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomNavDivider(finalOrFirst: true),
              BottomNavButton(
                icon: Icons.home,
                selected: _currentTab == 0,
                callback: callbackCurrentScreen,
                tab: 0,
              ),
              BottomNavDivider(),
              BottomNavButton(
                icon: Icons.assignment_ind,
                selected: _currentTab == 1,
                callback: callbackCurrentScreen,
                tab: 1,
              ),
              BottomNavDivider(),
              BottomNavButton(
                icon: Icons.assignment,
                selected: _currentTab == 2,
                callback: callbackCurrentScreen,
                tab: 2,
              ),
              BottomNavDivider(),
              BottomNavButton(
                icon: Icons.assessment,
                selected: _currentTab == 3,
                callback: callbackCurrentScreen,
                tab: 3,
              ),
              BottomNavDivider(finalOrFirst: true),
            ],
          ),
        ),
      ),
    );
  }
}
