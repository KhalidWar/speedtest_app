import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedtest/providers/theme_manager.dart';
import 'package:speedtest/screens/home_screen.dart';
import 'package:speedtest/services/themes.dart';
import 'package:syncfusion_flutter_core/core.dart';

import 'confidential.dart';

void main() {
  SyncfusionLicense.registerLicense(syncFusionLicenseKey);
  runApp(MyApp());
}

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
            theme: themeManager.isDark ? darkTheme : lightTheme,
            darkTheme: darkTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
