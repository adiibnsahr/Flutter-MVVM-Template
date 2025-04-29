import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

/// ViewModel untuk mengelola logika counter.
class CounterViewModel extends ChangeNotifier {
  final CounterModel _counter = CounterModel();

  /// Mendapatkan nilai counter saat ini.
  int get count => _counter.count;

  /// Menambah nilai counter.
  void increment() {
    _counter.count++;
    notifyListeners();
  }

  /// Mengurangi nilai counter.
  void decrement() {
    _counter.count--;
    notifyListeners();
  }
}
