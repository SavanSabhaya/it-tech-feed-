import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  bool _isProcessing = false;
  String? _errorMessage;

  bool get isProcessing => _isProcessing;
  String? get errorMessage => _errorMessage;

  void setProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
