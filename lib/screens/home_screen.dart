import 'package:flutter/material.dart';
import 'package:speedtest/screens/settings_screen.dart';
import 'package:speedtest/widgets/app_header.dart';

import 'history_screen.dart';
import 'speed_test.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndexedStack = 1;

  void _selectedIndex(int index) {
    setState(() {
      _selectedIndexedStack = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              AppHeader(),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndexedStack,
                  children: <Widget>[
                    HistoryScreen(),
                    SpeedTest(),
                    SettingsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 15,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: _selectedIndexedStack,
          onTap: _selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          selectedIconTheme: IconThemeData(size: 25),
          unselectedIconTheme: IconThemeData(size: 22),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.network_check),
              label: 'Speedtest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
