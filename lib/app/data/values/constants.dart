import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Timeouts {
  Timeouts._privateConstructor();

  static const CONNECT_TIMEOUT = 50000;
  static const RECEIVE_TIMEOUT = 50000;
}

class GlobalKeys {
  GlobalKeys._privateConstructor();

  static final navigationKey = GlobalKey<NavigatorState>();
}

class LoggerPrint {
  static final Logger _logger = Logger();

  /// Log a success message with ✅ emoji
  static void success(String message) {
    _logger.i("✅ SUCCESS: $message");
  }

  /// Log an error message with ❌ emoji
  static void error(String message) {
    _logger.e("❌ ERROR: $message");
  }

  /// Log an alert/warning message with ⚠️ emoji
  static void alert(String message) {
    _logger.w("⚠️ ALERT: $message");
  }

  /// Log a debug message with 🛠️ emoji
  static void debug(String message) {
    _logger.d("🛠️ DEBUG: $message");
  }
}
