import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/splash_page.dart';

/// Kelas untuk mengatur rute navigasi aplikasi.
///
/// Menggunakan named routes untuk memudahkan ekspansi.
class Routes {
  /// Rute untuk splash page.
  static const String splash = '/';

  /// Rute untuk home page.
  static const String home = '/home';

  /// Menghasilkan rute berdasarkan nama.
  ///
  /// [settings] Berisi nama rute dan argumen.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
