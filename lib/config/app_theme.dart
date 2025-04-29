import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Kelas untuk mengatur tema aplikasi secara terpusat.
///
/// Menyediakan tema light dan dark dengan font modern, warna, dan animasi.
class AppTheme {
  // --- Font ---
  /// Font utama menggunakan Google Fonts Poppins.
  static final TextStyle fontFamily = GoogleFonts.poppins();

  /// Ukuran font untuk teks kecil.
  static const double fontSizeSmall = 16.0;

  /// Ukuran font untuk teks sedang.
  static const double fontSizeMedium = 24.0;

  /// Ukuran font untuk teks besar.
  static const double fontSizeLarge = 48.0;

  // --- Warna Light Theme ---
  /// Warna utama untuk light theme.
  static const Color lightPrimaryColor = Color(0xFF1E88E5);

  /// Warna teks untuk light theme.
  static const Color lightTextColor = Color(0xFF212121);

  /// Warna latar untuk light theme.
  static const Color lightBackgroundColor = Color(0xFFF5F5F5);

  // --- Warna Dark Theme ---
  /// Warna utama untuk dark theme.
  static const Color darkPrimaryColor = Color(0xFF64B5F6);

  /// Warna teks untuk dark theme.
  static const Color darkTextColor = Color(0xFFE0E0E0);

  /// Warna latar untuk dark theme.
  static const Color darkBackgroundColor = Color(0xFF121212);

  // --- Gradient ---
  /// Gradient untuk tombol atau elemen dekoratif.
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [lightPrimaryColor, Color(0xFF1976D2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // --- Shadow ---
  /// Shadow untuk card.
  static final BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 8,
    offset: const Offset(0, 2),
  );

  // --- Rounded Corner ---
  /// Radius untuk tombol.
  static const double buttonBorderRadius = 16.0;

  /// Radius untuk card.
  static const double cardBorderRadius = 20.0;

  // --- Animasi ---
  /// Durasi animasi default.
  static const Duration animationDuration = Duration(milliseconds: 400);

  /// Kurva animasi untuk transisi halus.
  static const Curve animationCurve = Curves.easeInOutCubic;

  // --- Ikon ---
  /// Ikon placeholder untuk splash screen.
  static const IconData splashIcon = Icons.flutter_dash;

  /// Ukuran ikon relatif terhadap lebar layar.
  static const double splashIconSizeMultiplier = 0.25;

  /// Tema light aplikasi.
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    textTheme: TextTheme(
      headlineLarge: fontFamily.copyWith(
        fontSize: fontSizeLarge,
        fontWeight: FontWeight.w700,
        color: lightTextColor,
      ),
      headlineMedium: fontFamily.copyWith(
        fontSize: fontSizeMedium,
        fontWeight: FontWeight.w600,
        color: lightTextColor,
      ),
      bodyMedium: fontFamily.copyWith(
        fontSize: fontSizeSmall,
        color: lightTextColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        elevation: 2,
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );

  /// Tema dark aplikasi.
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    textTheme: TextTheme(
      headlineLarge: fontFamily.copyWith(
        fontSize: fontSizeLarge,
        fontWeight: FontWeight.w700,
        color: darkTextColor,
      ),
      headlineMedium: fontFamily.copyWith(
        fontSize: fontSizeMedium,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      bodyMedium: fontFamily.copyWith(
        fontSize: fontSizeSmall,
        color: darkTextColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        elevation: 2,
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      elevation: 4,
      shadowColor: Colors.white.withOpacity(0.1),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
