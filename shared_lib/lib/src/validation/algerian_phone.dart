/// Algerian mobile numbers in E.164 (`+213[5-7]XXXXXXXX`).
abstract final class AlgerianPhone {
  static final RegExp e164Pattern = RegExp(r'^\+213[5-7][0-9]{8}$');

  /// Builds E.164 from national digits only (9 digits, no country code).
  static String toE164(String nationalDigits) {
    final digits = nationalDigits.replaceAll(RegExp(r'\D'), '');
    return '+213$digits';
  }

  /// Validates full E.164 or builds from national part and validates.
  static String? validateNationalInput(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 9) {
      return null;
    }
    final e164 = toE164(digits);
    if (!e164Pattern.hasMatch(e164)) {
      return null;
    }
    return e164;
  }

  static String? validateE164(String phone) {
    final normalized = phone.replaceAll(RegExp(r'\s'), '');
    if (!e164Pattern.hasMatch(normalized)) {
      return null;
    }
    return normalized;
  }

  /// Display format: +213 5XX XX XX XX
  static String formatDisplay(String e164) {
    if (!e164Pattern.hasMatch(e164)) {
      return e164;
    }
    final national = e164.substring(4);
    return '+213 ${national.substring(0, 1)}'
        '${national.substring(1, 3)} '
        '${national.substring(3, 5)} '
        '${national.substring(5, 7)} '
        '${national.substring(7, 9)}';
  }
}
