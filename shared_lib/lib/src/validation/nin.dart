/// Algerian NIN — 18 digits, aligned with backend `internal/nin/validate.go`.
abstract final class NinValidator {
  static final RegExp pattern = RegExp(r'^[12][0-9]{17}$');

  static const int _minBirthYear = 1900;

  static String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');

  static String normalize(String input) {
    return input.replaceAll(RegExp(r'[\s\-_.\t]'), '').trim();
  }

  static bool isValid(String input) => validate(input) != null;

  /// Full local validation (format, year, commune, forgery patterns).
  static String? validate(String input) {
    final digits = digitsOnly(normalize(input));
    if (digits.length != 18) {
      return null;
    }
    if (!pattern.hasMatch(digits)) {
      return null;
    }
    if (_isAllSameDigit(digits)) {
      return null;
    }
    if (!_isPlausibleRegistrationYear(digits.substring(2, 5))) {
      return null;
    }
    if (digits.substring(5, 9) == '0000') {
      return null;
    }
    return digits;
  }

  static bool _isAllSameDigit(String digits) {
    final first = digits[0];
    for (var i = 1; i < digits.length; i++) {
      if (digits[i] != first) {
        return false;
      }
    }
    return true;
  }

  static bool _isPlausibleRegistrationYear(String year3) {
    if (year3.length != 3) {
      return false;
    }
    final n = int.tryParse(year3);
    if (n == null) {
      return false;
    }
    final currentYear = DateTime.now().toUtc().year;
    for (final candidate in [2000 + n, 1000 + n]) {
      if (candidate >= _minBirthYear && candidate <= currentYear) {
        return true;
      }
    }
    return false;
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
