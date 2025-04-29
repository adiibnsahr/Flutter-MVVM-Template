import 'package:flutter/material.dart';

/// ViewModel untuk mengelola tema aplikasi (light/dark)
class ThemeViewModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  /// Mendapatkan mode tema saat ini.
  ThemeMode get themeMode => _themeMode;

  /// Mengatur mode tema
  ///
  /// [mode] Mode tema yang diinginkan (system, light, dark).
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  /// Toggle antara light dan dark mode
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
