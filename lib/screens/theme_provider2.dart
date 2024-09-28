import 'package:flutter/material.dart';

class theme_provider2 with ChangeNotifier {
  ThemeData _themeData;

  theme_provider2() : _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void updateFontFamily(String fontFamily) {
    _themeData = _themeData.copyWith(
      textTheme: _themeData.textTheme.apply(fontFamily: fontFamily),
    );
    notifyListeners(); 
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeDataBoo {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
