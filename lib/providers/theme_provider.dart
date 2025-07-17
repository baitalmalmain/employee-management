import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeData _currentTheme = lightTheme;

  ThemeMode get themeMode => _themeMode;
  ThemeData get currentTheme => _currentTheme;

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: const AppBarTheme(color: Colors.blueGrey),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(color: Colors.indigo),
  );

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _currentTheme = isDark ? darkTheme : lightTheme;
    notifyListeners();
  }
}
