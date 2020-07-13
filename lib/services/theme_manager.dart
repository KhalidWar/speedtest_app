import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  SharedPreferences sharedPreferences;
  bool _darkTheme;
  final String key = 'themeKey';

  // todo figure out how textTheme body works
  static TextTheme textTheme = TextTheme();

  static ButtonThemeData buttonThemeData = ButtonThemeData(
    splashColor: Colors.red,
    highlightColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static CardTheme cardTheme = CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static DialogTheme dialogTheme = DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(style: BorderStyle.solid, color: Colors.red)),
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    primaryColorDark: Color(0xffefefef),
    scaffoldBackgroundColor: Color(0xffefefef),
    toggleableActiveColor: Colors.red,
    accentColor: Colors.red,
    buttonTheme: buttonThemeData,
    cardTheme: cardTheme,
    dialogTheme: dialogTheme,
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    primaryColorLight: Color(0xFF0f0f0f),
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    toggleableActiveColor: Colors.red,
    accentColor: Colors.red,
    buttonTheme: buttonThemeData,
    cardTheme: cardTheme.copyWith(color: Color(0xFF0f0f0f)),
    dialogTheme: dialogTheme.copyWith(backgroundColor: Color(0xFF0f0f0f)),
  );

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
