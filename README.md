# Template Flutter MVVM

Template Flutter modern, skalabel, dan kaya fitur berbasis arsitektur MVVM (Model-View-ViewModel). Dirancang untuk mempermudah memulai proyek Flutter dengan fondasi yang kuat, template ini mencakup lokalisasi, mode gelap, pengujian menyeluruh, logging canggih, dan struktur modular.

## Fitur

- **Arsitektur MVVM**: Pemisahan yang jelas antara model, view model, dan view untuk kode yang terorganisir.
- **Lokalisasi**: Mendukung bahasa Indonesia (`id`) dan Inggris (`en`) menggunakan `flutter_localizations` dan `intl`. Mudah diperluas untuk bahasa lain.
- **Mode Gelap**: Peralihan tema terang/gelap secara otomatis (mengikuti sistem) atau manual.
- **UI Modern**: Menggunakan font Google (Poppins), animasi halus (fade+scale), dan tema yang dapat disesuaikan dengan gradien dan bayangan.
- **Logging Canggih**: Logger global dengan keluaran ke konsol dan file, dikelola melalui `get_it`, dengan konfigurasi berbasis lingkungan (dev/prod).
- **Pengujian Menyeluruh**:
  - **Unit Test**: Untuk model dan view model menggunakan `mockito`.
  - **Widget Test**: Untuk komponen UI dengan dukungan lokalisasi.
  - **Integration Test**: Untuk alur aplikasi, termasuk navigasi dan interaksi pengguna.
- **Dependency Injection**: Menggunakan `get_it` untuk mengelola logger dan layanan lainnya.
- **Struktur Skalabel**: Folder modular (`config/`, `l10n/`, `utils/`, dll.) untuk pengembangan cepat.
- **Siap CI/CD**: Struktur mendukung pipeline seperti GitHub Actions.

## Struktur Proyek

```
lib/
├── config/                   # File konfigurasi
│   ├── app_theme.dart        # Pengaturan tema (warna, font, dll.)
│   ├── routes.dart           # Rute navigasi bernama
│   └── environment.dart      # Konfigurasi lingkungan dev/prod
├── constants/                # Konstanta aplikasi
│   └── app_constants.dart    # Misalnya, durasi splash
├── l10n/                     # File lokalisasi
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   └── app_localizations_id.dart
├── models/                   # Model data
│   └── counter_model.dart
├── utils/                    # Kelas utilitas
│   └── app_logger.dart       # Logger canggih
├── view_models/              # Logika bisnis dan manajemen state
│   ├── counter_view_model.dart
│   ├── theme_view_model.dart
│   └── localization_view_model.dart
├── views/                    # Layar UI
│   ├── home_page.dart
│   └── splash_page.dart
├── main.dart                 # Titik masuk aplikasi
test/
├── unit/                     # Pengujian unit
│   ├── counter_model_test.dart
│   ├── counter_view_model_test.dart
│   └── localization_view_model_test.dart
├── widget/                   # Pengujian widget
│   ├── home_page_test.dart
│   └── splash_page_test.dart
├── integration/              # Pengujian integrasi
│   └── app_test.dart
```

## Prasyarat

- **Flutter SDK**: Versi 3.0.0 atau lebih tinggi.
- **Dart**: Versi 2.17.0 atau lebih tinggi.
- **IDE**: VS Code atau Android Studio disarankan.
- Emulator atau perangkat fisik untuk pengujian integrasi.

## Cara Setup

1. **Klon atau salin template**:
   ```bash
   git clone https://github.com/adiibnsahr/Flutter-MVVM-Template.git
   cd Flutter-MVVM-Template
   ```
   Atau buat proyek Flutter baru:
   ```bash
   flutter create Flutter-MVVM-Template
   cd Flutter-MVVM-Template
   ```

2. **Perbarui `pubspec.yaml`** dengan dependensi berikut:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     provider: ^6.1.4
     google_fonts: ^6.2.1
     logger: ^2.5.0
     get_it: ^8.0.3
     path_provider: ^2.1.5
     flutter_localizations:
       sdk: flutter
     intl: ^0.19.0
   dev_dependencies:
     flutter_test:
       sdk: flutter
     mockito: ^5.4.4
     build_runner: ^2.4.6
   flutter:
     generate: true
   ```

3. **Instal dependensi**:
   ```bash
   flutter pub get
   ```

4. **Salin struktur proyek**:
   Buat folder dan file sesuai struktur di atas, lalu salin kode yang disediakan ke masing-masing file.

5. **Jalankan aplikasi**:
   ```bash
   flutter run
   ```

## Cara Penggunaan

### Menjalankan Pengujian

- **Unit Test** (menguji model dan view model):
  ```bash
  flutter test test/unit
  ```
- **Widget Test** (menguji komponen UI):
  ```bash
  flutter test test/widget
  ```
- **Integration Test** (menguji alur aplikasi):
  ```bash
  flutter test integration_test
  ```
  Pastikan emulator atau perangkat sudah aktif.

### Menyesuaikan Template

#### Mengubah Tema
Edit `lib/config/app_theme.dart` untuk menyesuaikan:
- **Font**: Ganti `GoogleFonts.poppins()` dengan font lain (misalnya, `GoogleFonts.inter()`).
- **Warna**: Ubah `lightPrimaryColor`, `darkPrimaryColor`, dll.
- **Animasi**: Sesuaikan `animationDuration` atau `animationCurve`.
- **Logo**: Ganti `splashIcon` dengan gambar:
  ```dart
  static const String splashImage = 'assets/logo.png';
  ```
  Tambahkan ke `pubspec.yaml`:
  ```yaml
  assets:
    - assets/logo.png
  ```
  Perbarui `splash_page.dart`:
  ```dart
  Image.asset(
    AppTheme.splashImage,
    width: constraints.maxWidth * AppTheme.splashIconSizeMultiplier,
  ),
  ```

#### Menambah Bahasa Baru
1. Buat file baru di `l10n/` (misalnya, `app_localizations_fr.dart` untuk bahasa Prancis):
   ```dart
   const Map<String, String> fr = {
     'app_title': 'Compteur Moderne',
     'splash_title': 'MVVM Moderne',
     'count_label': 'Compte:',
     'increment_button': 'Incrémenter',
     'decrement_button': 'Décrémenter',
     'toggle_theme': 'Changer de thème',
     'toggle_language': 'Changer de langue',
   };
   ```
2. Perbarui `lib/l10n/app_localizations.dart`:
   ```dart
   static final Map<String, Map<String, String>> _localizedValues = {
     'en': en,
     'id': id,
     'fr': fr,
   };
   ```
   Tambahkan ke `isSupported`:
   ```dart
   bool isSupported(Locale locale) => ['en', 'id', 'fr'].contains(locale.languageCode);
   ```
3. Perbarui `main.dart`:
   ```dart
   supportedLocales: const [Locale('en'), Locale('id'), Locale('fr')],
   ```
4. Sesuaikan `LocalizationViewModel` untuk mendukung siklus bahasa atau tambahkan setter spesifik.

#### Menambah Halaman Baru
1. Buat file baru di `views/` (misalnya, `settings_page.dart`):
   ```dart
   import 'package:flutter/material.dart';
   import '../config/app_theme.dart';
   import '../l10n/app_localizations.dart';

   class SettingsPage extends StatelessWidget {
     const SettingsPage({super.key});

     @override
     Widget build(BuildContext context) {
       final l10n = AppLocalizations.of(context)!;
       return Scaffold(
         appBar: AppBar(
           title: Text(l10n.translate('settings_title')),
         ),
         body: Center(
           child: Text(
             l10n.translate('settings_content'),
             style: Theme.of(context).textTheme.headlineMedium,
           ),
         ),
       );
     }
   }
   ```
2. Tambahkan terjemahan di `l10n/app_localizations_en.dart` dan `app_localizations_id.dart`:
   ```dart
   'settings_title': 'Settings',
   'settings_content': 'Settings Page',
   ```
   ```dart
   'settings_title': 'Pengaturan',
   'settings_content': 'Halaman Pengaturan',
   ```
3. Tambahkan rute di `lib/config/routes.dart`:
   ```dart
   static const String settings = '/settings';
   case settings:
     return MaterialPageRoute(builder: (_) => const SettingsPage());
   ```
4. Navigasi ke halaman baru (misalnya, dari `HomePage`):
   ```dart
   Navigator.pushNamed(context, Routes.settings);
   ```
5. Tambahkan pengujian di `test/unit/`, `test/widget/`, atau `test/integration/` sesuai kebutuhan.

#### Memperluas Logger
- Tambahkan keluaran baru (misalnya, Firebase) di `lib/utils/app_logger.dart`:
  ```dart
  class FirebaseOutput extends LogOutput {
    @override
    void output(OutputEvent event) {
      // Implementasi logging ke Firebase
    }
  }
  ```
  Perbarui `_logger`:
  ```dart
  output: MultiOutput([
    ConsoleOutput(),
    if (Environment.isFileLoggingEnabled) FileOutput(),
    FirebaseOutput(),
  ]),
  ```
- Gunakan logger di kelas lain:
  ```dart
  AppLogger.debug('Pesan debug');
  AppLogger.error('Terjadi error', error, stackTrace);
  ```

#### Menambah Pengujian Baru
- **Unit Test**: Tambahkan di `test/unit/` untuk model atau view model baru.
- **Widget Test**: Tambahkan di `test/widget/` untuk halaman baru.
- **Integration Test**: Perluas `test/integration/app_test.dart` untuk alur baru.

## Dokumentasi

- **Dokumentasi Kode**: Semua kelas, metode, dan properti memiliki komentar Dart (`///`). Gunakan IDE seperti VS Code untuk melihat dokumentasi saat hover.
- **Pengujian**: Pengujian dikelompokkan berdasarkan jenis (unit, widget, integrasi) dengan deskripsi jelas menggunakan `group` dan `test`.
- **Logging**: Log ditulis ke konsol dan file `app.log` (di mode dev) di direktori dokumen aplikasi.
- **Lokalisasi**: Terjemahan dikelola di `l10n/` dengan struktur kunci-nilai yang sederhana.

## Kontribusi

1. Fork repositori.
2. Buat branch fitur baru (`git checkout -b fitur/fitur-baru`).
3. Commit perubahan (`git commit -m 'Menambah fitur baru'`).
4. Push ke branch (`git push origin fitur/fitur-baru`).
5. Buat pull request.

Pastikan semua pengujian lulus dan tambahkan pengujian untuk fitur baru.

## Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT. Lihat file `LICENSE` untuk detail.

## Penghargaan

Dibuat dengan 💙 menggunakan Flutter, terinspirasi oleh kebutuhan akan template MVVM yang skalabel dan modern. Adi Ibn Sahr 2025
