import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedtest/screens/home_screen.dart';
import 'package:speedtest/services/theme_manager.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Speed Test',
            theme: themeManager.isDark
                ? themeManager.darkTheme
                : themeManager.lightTheme,
            darkTheme: themeManager.darkTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
