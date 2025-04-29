import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';
import '../config/environment.dart';

/// Logger global untuk mencatat aktivitas aplikasi.
class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, printTime: true),
    output: _AppMultiOutput(),
  );

  /// Menginisialisasi logger dengan output ke konsol dan file (jika diizinkan).
  static Future<void> init() async {
    GetIt.I.registerSingleton<Logger>(_logger);
  }

  /// Log level debug.
  static void debug(String message) => GetIt.I<Logger>().d(message);

  /// Log level info.
  static void info(String message) => GetIt.I<Logger>().i(message);

  /// Log level warning.
  static void warning(String message) => GetIt.I<Logger>().w(message);

  /// Log level error.
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      GetIt.I<Logger>().e(message, error: error, stackTrace: stackTrace);
}

/// Kelas untuk mengelola multiple output (konsol dan file).
class _AppMultiOutput extends LogOutput {
  final List<LogOutput> outputs = [ConsoleOutput()];

  _AppMultiOutput() {
    if (Environment.isFileLoggingEnabled) {
      _initFileOutput();
    }
  }

  /// Inisialisasi output ke file.
  Future<void> _initFileOutput() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app.log');
    outputs.add(FileOutput(file: file));
  }

  @override
  void output(OutputEvent event) {
    for (var output in outputs) {
      output.output(event);
    }
  }
}

/// Output logger ke file.
class FileOutput extends LogOutput {
  final File file;

  FileOutput({required this.file});

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      file.writeAsStringSync('$line\n', mode: FileMode.append);
    }
  }
}
