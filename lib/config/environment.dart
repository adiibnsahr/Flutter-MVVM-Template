/// Konfigurasi environment aplikasi.
class Environment {
  static const String dev = 'dev';
  static const String prod = 'prod';

  /// Environment saat ini (ganti ke 'prod' untuk produksi).
  static const String current = dev;

  /// Apakah logging ke file aktif.
  static bool get isFileLoggingEnabled => current == dev;
}
