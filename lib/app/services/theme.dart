import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  var isDark = true;

  ThemeData get currentTheme => isDark ? _dark : _light;

  set themeSwitcher(bool value) {
    if (value) {
      isDark = true;
    } else {
      isDark = false;
    }
    notifyListeners();
  }

  final ThemeData _light = ThemeData(primaryColor: _primaryColor);

  final ThemeData _dark = ThemeData.dark();

  static const _primaryColor = Colors.white;
}
