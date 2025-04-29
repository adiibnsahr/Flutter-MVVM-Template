import 'package:flutter/material.dart';
import '../utils/app_logger.dart';

/// ViewModel untuk mengelola bahasa aplikasi.
class LocalizationViewModel extends ChangeNotifier {
  Locale _locale = const Locale('en');

  /// Mendapatkan locale saat ini.
  Locale get locale => _locale;

  /// Mengatur locale baru.
  void setLocale(Locale locale) {
    if (_locale.languageCode != locale.languageCode) {
      _locale = locale;
      AppLogger.info('Language changed to: ${locale.languageCode}');
      notifyListeners();
    }
  }

  /// Toggle antara bahasa Inggris dan Indonesia.
  void toggleLanguage() {
    setLocale(
      _locale.languageCode == 'en' ? const Locale('id') : const Locale('en'),
    );
  }
}
