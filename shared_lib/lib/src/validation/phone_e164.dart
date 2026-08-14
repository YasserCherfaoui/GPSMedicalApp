import '../constants/registration_countries.dart';
import 'algerian_phone.dart';

/// E.164 mobiles accepted at registration: DZ `+213[5-7]…` or TN `+216[2459]…`.
abstract final class PhoneE164 {
  static final RegExp dzPattern = AlgerianPhone.e164Pattern;
  static final RegExp tnPattern = RegExp(r'^\+216[2459][0-9]{7}$');

  static int nationalDigitCount(RegistrationCountry country) =>
      switch (country) {
        RegistrationCountry.dz => 9,
        RegistrationCountry.tn => 8,
      };

  static String toE164(RegistrationCountry country, String nationalDigits) {
    final digits = nationalDigits.replaceAll(RegExp(r'\D'), '');
    return '${country.dialingCode}$digits';
  }

  static String? validateNationalInput(
    RegistrationCountry country,
    String input,
  ) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length != nationalDigitCount(country)) {
      return null;
    }
    final e164 = toE164(country, digits);
    return validateE164(e164, country);
  }

  static String? validateE164(String phone, [RegistrationCountry? country]) {
    final normalized = phone.replaceAll(RegExp(r'\s'), '');
    if (country == null) {
      if (dzPattern.hasMatch(normalized) || tnPattern.hasMatch(normalized)) {
        return normalized;
      }
      return null;
    }
    final pattern = switch (country) {
      RegistrationCountry.dz => dzPattern,
      RegistrationCountry.tn => tnPattern,
    };
    if (!pattern.hasMatch(normalized)) {
      return null;
    }
    return normalized;
  }

  static bool matchesCountry(String phone, RegistrationCountry country) {
    return validateE164(phone, country) != null;
  }

  static String formatDisplay(String e164) {
    final dz = AlgerianPhone.formatDisplay(e164);
    if (dz != e164) {
      return dz;
    }
    if (!tnPattern.hasMatch(e164)) {
      return e164;
    }
    final national = e164.substring(4);
    return '+216 ${national.substring(0, 1)}'
        '${national.substring(1, 3)} '
        '${national.substring(3, 5)} '
        '${national.substring(5, 8)}';
  }
}
