import 'package:flutter/material.dart';

class theme_provider2 with ChangeNotifier {
  ThemeData _themeData;

  theme_provider2() : _themeData = ThemeData.light(); // Mặc định là light mode

  ThemeData get themeData => _themeData;

  // Phương thức thay đổi font chữ
  void updateFontFamily(String fontFamily) {
    _themeData = _themeData.copyWith(
      textTheme: _themeData.textTheme.apply(fontFamily: fontFamily),
    );
    notifyListeners(); // Cập nhật UI
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
