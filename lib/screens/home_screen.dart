import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:speedtest/screens/settings_screen.dart';

import 'history_screen.dart';
import 'speed_test.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final tabs = [
    HistoryScreen(),
    SpeedTest(),
    SettingsScreen(),
  ];

  void selectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 100),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeScaleTransition(animation: primaryAnimation, child: child),
        child: tabs[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        currentIndex: _selectedIndex,
        onTap: selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 22),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.network_check),
            title: Text('Speedtest'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
