import 'package:flutter/services.dart';

class TextFormatterUtils {
  /// ---------------- Basic Formatters ----------------

  /// Allows only alphabets (uppercase/lowercase) and space
  static final TextInputFormatter nameFormatter = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"));

  /// Digits only
  static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.digitsOnly;

  /// Decimal numbers (up to 2 decimal places)
  static final TextInputFormatter decimalNumber = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

  /// Alphanumeric (letters, digits, space)
  static final TextInputFormatter alphanumeric = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'));

  /// Email-safe characters only
  static final TextInputFormatter emailCharactersOnly = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@._\-]"));

  /// ---------------- Specific Field Formatters ----------------

  /// Phone number: only digits, max 10
  static final TextInputFormatter phoneNumber = LengthLimitingTextInputFormatter(10);

  /// Aadhaar: only digits, max 12
  static final TextInputFormatter aadhaarNumber = LengthLimitingTextInputFormatter(12);

  /// PIN code: only digits, max 6
  static final TextInputFormatter pinCode = LengthLimitingTextInputFormatter(6);
}