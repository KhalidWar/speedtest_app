import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  SharedPreferences sharedPreferences;
  bool _darkTheme;
  final String key = 'themeKey';

  bool get isDark => _darkTheme;

  ThemeManager() {
    _darkTheme = false;
    _loadTheme();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveTheme();
    notifyListeners();
  }

  _initPrefs() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  _saveTheme() async {
    await _initPrefs();
    sharedPreferences.setBool(key, _darkTheme);
  }

  _loadTheme() async {
    await _initPrefs();
    _darkTheme = sharedPreferences.getBool(key) ?? false;
    notifyListeners();
  }
}

bool isLightTheme(BuildContext context) {
  var isLight = Theme.of(context).brightness == Brightness.light;
  return isLight;
}
