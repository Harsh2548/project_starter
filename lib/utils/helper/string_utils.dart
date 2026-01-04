class StringUtils {
  /// Extracts the first name from a full name
  /// Example: "John Doe" -> "John"
  static String extractFirstName(String fullName) {
    if (fullName.trim().isEmpty) return '';
    return fullName.trim().split(' ').first;
  }

  /// Extracts the last name from a full name
  /// Example: "John Doe" -> "Doe"
  static String extractLastName(String fullName) {
    if (fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(' ');
    return parts.length > 1 ? parts.last : '';
  }

  /// Gets the first letter of a name (uppercase)
  /// Example: "John" -> "J"
  static String getFirstLetter(String name) {
    if (name.trim().isEmpty) return '';
    return name.trim()[0].toUpperCase();
  }

  /// Gets initials from a full name
  /// Example: "John Doe" -> "JD"
  static String getInitials(String fullName, {int maxInitials = 2}) {
    if (fullName.trim().isEmpty) return '';

    final parts = fullName.trim().split(' ');
    final initials = parts
        .where((part) => part.isNotEmpty)
        .take(maxInitials)
        .map((part) => part[0].toUpperCase())
        .join();

    return initials;
  }

  /// Capitalizes the first letter of a string
  /// Example: "hello" -> "Hello"
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalizes the first letter of each word
  /// Example: "hello world" -> "Hello World"
  static String capitalizeWords(String text) {
    if (text.trim().isEmpty) return text;

    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Checks if a string is a valid email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Checks if a string contains only digits
  static bool isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }

  /// Removes all whitespace from a string
  static String removeWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), '');
  }

  /// Truncates a string to a specified length with ellipsis
  /// Example: truncate("Hello World", 5) -> "Hello..."
  static String truncate(String text, int maxLength, {String ellipsis = '...'}) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength) + ellipsis;
  }

  /// Masks a string, showing only specified characters
  /// Example: maskString("1234567890", visibleStart: 2, visibleEnd: 2) -> "12******90"
  static String maskString(
      String text, {
        int visibleStart = 0,
        int visibleEnd = 0,
        String maskChar = '*',
      }) {
    if (text.length <= visibleStart + visibleEnd) return text;

    final start = text.substring(0, visibleStart);
    final end = text.substring(text.length - visibleEnd);
    final masked = maskChar * (text.length - visibleStart - visibleEnd);

    return start + masked + end;
  }

  /// Reverses a string
  /// Example: "hello" -> "olleh"
  static String reverse(String text) {
    return text.split('').reversed.join('');
  }

  /// Counts the number of words in a string
  static int wordCount(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  /// Checks if a string is a palindrome
  static bool isPalindrome(String text) {
    final cleaned = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleaned == cleaned.split('').reversed.join('');
  }

  /// Converts a string to camelCase
  /// Example: "hello world" -> "helloWorld"
  static String toCamelCase(String text) {
    if (text.isEmpty) return text;

    final words = text.split(RegExp(r'[\s_-]+'));
    if (words.isEmpty) return text;

    return words.first.toLowerCase() +
        words.skip(1).map((word) => capitalize(word)).join('');
  }

  /// Converts a string to snake_case
  /// Example: "helloWorld" -> "hello_world"
  static String toSnakeCase(String text) {
    return text
        .replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => '_${match.group(0)!.toLowerCase()}',
    )
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'^_'), '');
  }

  /// Removes special characters, keeping only alphanumeric and spaces
  static String removeSpecialCharacters(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }

  /// Extracts numbers from a string
  /// Example: "abc123def456" -> "123456"
  static String extractNumbers(String text) {
    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Checks if string contains only alphabets
  static bool isAlphabetic(String text) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  }
}