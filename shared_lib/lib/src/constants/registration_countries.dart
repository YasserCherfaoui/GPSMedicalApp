import 'package:gps_medical_api/gps_medical_api.dart';

/// Supported registration countries (client constant — OpenAPI `CountryCode`).
enum RegistrationCountry { dz, tn }

extension RegistrationCountryX on RegistrationCountry {
  String get iso => switch (this) {
    RegistrationCountry.dz => 'DZ',
    RegistrationCountry.tn => 'TN',
  };

  CountryCode get apiCode => switch (this) {
    RegistrationCountry.dz => CountryCode.DZ,
    RegistrationCountry.tn => CountryCode.TN,
  };

  String get dialingCode => switch (this) {
    RegistrationCountry.dz => '+213',
    RegistrationCountry.tn => '+216',
  };

  String get flag => switch (this) {
    RegistrationCountry.dz => '🇩🇿',
    RegistrationCountry.tn => '🇹🇳',
  };

  bool get requiresNin => this == RegistrationCountry.dz;

  String get consentPolicyVersion => switch (this) {
    RegistrationCountry.dz => RegistrationCountries.consentVersionDz,
    RegistrationCountry.tn => RegistrationCountries.consentVersionTn,
  };

  static RegistrationCountry? fromIso(String? iso) {
    switch (iso?.toUpperCase()) {
      case 'DZ':
        return RegistrationCountry.dz;
      case 'TN':
        return RegistrationCountry.tn;
      default:
        return null;
    }
  }
}

/// Catalog of countries shown on the first registration step.
abstract final class RegistrationCountries {
  static const consentVersionDz = 'dz-1.2';
  static const consentVersionTn = 'tn-1.0';

  static const List<RegistrationCountry> all = [
    RegistrationCountry.dz,
    RegistrationCountry.tn,
  ];
}

/// Progress indices for the registration stepper (1-based).
abstract final class RegistrationSteps {
  static int total(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 6 : 7;

  static int country(RegistrationCountry? _) => 1;

  static int nin(RegistrationCountry? _) => 2;

  static int fullName(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 2 : 3;

  static int phone(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 3 : 4;

  static int password(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 4 : 5;

  static int consent(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 5 : 6;

  static int otp(RegistrationCountry? country) =>
      country == RegistrationCountry.tn ? 6 : 7;
}
