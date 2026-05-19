/// Algerian NIN — 18 digits, first digit 1 or 2.
abstract final class NinValidator {
  static final RegExp pattern = RegExp(r'^[12][0-9]{17}$');

  static String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');

  static bool isValid(String input) {
    final digits = digitsOnly(input);
    return digits.length == 18 && pattern.hasMatch(digits);
  }

  static String? validate(String input) {
    final digits = digitsOnly(input);
    if (digits.length != 18) {
      return null;
    }
    if (!pattern.hasMatch(digits)) {
      return null;
    }
    return digits;
  }

  /// Groups of 4 for display: `1234 5678 9012 3456 78`
  static String formatDisplay(String digits) {
    final d = digitsOnly(digits);
    if (d.length != 18) {
      return digits;
    }
    final parts = <String>[];
    for (var i = 0; i < 16; i += 4) {
      parts.add(d.substring(i, i + 4));
    }
    parts.add(d.substring(16, 18));
    return parts.join(' ');
  }
}
