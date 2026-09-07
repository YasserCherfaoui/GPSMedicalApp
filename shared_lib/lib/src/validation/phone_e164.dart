import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../constants/registration_countries.dart';

/// E.164 validation for the 29 registration countries (libphonenumber-class).
abstract final class PhoneE164 {
  static final RegExp _e164Shape = RegExp(r'^\+[1-9][0-9]{6,14}$');

  static IsoCode? _iso(RegistrationCountry country) {
    try {
      return IsoCode.values.byName(country.iso);
    } catch (_) {
      return null;
    }
  }

  /// Typical national significant-number length hint for the input field.
  static int nationalDigitCount(RegistrationCountry country) {
    return switch (country.iso) {
      'DZ' => 9,
      'TN' => 8,
      'FR' || 'BE' || 'DE' || 'IT' || 'ES' || 'PT' || 'NL' || 'AT' || 'GR' ||
      'PL' || 'RO' || 'HU' || 'CZ' || 'SE' || 'DK' || 'FI' || 'IE' || 'HR' ||
      'BG' || 'SK' || 'SI' || 'LT' || 'LV' || 'EE' || 'CY' || 'LU' || 'MT' =>
        9,
      _ => 9,
    };
  }

  static String toE164(RegistrationCountry country, String nationalDigits) {
    final digits = nationalDigits.replaceAll(RegExp(r'\D'), '');
    return '${country.dialingCode}$digits';
  }

  static String? validateNationalInput(
    RegistrationCountry country,
    String input,
  ) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return null;
    final e164 = toE164(country, digits);
    return validateE164(e164, country);
  }

  static String? validateE164(String phone, [RegistrationCountry? country]) {
    final normalized = phone.replaceAll(RegExp(r'\s'), '');
    if (!_e164Shape.hasMatch(normalized)) return null;

    try {
      final parsed = PhoneNumber.parse(normalized);
      if (!parsed.isValid()) return null;
      if (country != null) {
        final expected = _iso(country);
        if (expected == null || parsed.isoCode != expected) return null;
      } else {
        final region = parsed.isoCode.name;
        if (RegistrationCountry.fromIso(region) == null) return null;
      }
      return '+${parsed.countryCode}${parsed.nsn}';
    } catch (_) {
      return null;
    }
  }

  static bool matchesCountry(String phone, RegistrationCountry country) {
    return validateE164(phone, country) != null;
  }

  static String formatDisplay(String e164) {
    try {
      final parsed = PhoneNumber.parse(e164);
      return parsed.formatNsn();
    } catch (_) {
      return e164;
    }
  }
}
