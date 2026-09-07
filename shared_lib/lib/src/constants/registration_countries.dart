import 'package:flutter/foundation.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// Supported registration countries (OpenAPI `CountryCode` — DZ + TN + EU-27).
@immutable
class RegistrationCountry {
  const RegistrationCountry._({
    required this.iso,
    required this.dialingCode,
    required this.flag,
    required this.nameFr,
    required this.apiCode,
  });

  final String iso;
  final String dialingCode;
  final String flag;

  /// French display name (FR-first posture for EU — Amendment 2 §A9 / R-15).
  final String nameFr;
  final CountryCode apiCode;

  /// NIN collection retired (Amendment 2 / ADR 0026).
  bool get requiresNin => false;

  String get consentPolicyVersion {
    switch (iso) {
      case 'DZ':
        return RegistrationCountries.consentVersionDz;
      case 'TN':
        return RegistrationCountries.consentVersionTn;
      default:
        return RegistrationCountries.consentVersionEu;
    }
  }

  bool get isEu => iso != 'DZ' && iso != 'TN';

  static const dz = RegistrationCountry._(
    iso: 'DZ',
    dialingCode: '+213',
    flag: '🇩🇿',
    nameFr: 'Algérie',
    apiCode: CountryCode.DZ,
  );
  static const tn = RegistrationCountry._(
    iso: 'TN',
    dialingCode: '+216',
    flag: '🇹🇳',
    nameFr: 'Tunisie',
    apiCode: CountryCode.TN,
  );
  static const at = RegistrationCountry._(
    iso: 'AT',
    dialingCode: '+43',
    flag: '🇦🇹',
    nameFr: 'Autriche',
    apiCode: CountryCode.AT,
  );
  static const be = RegistrationCountry._(
    iso: 'BE',
    dialingCode: '+32',
    flag: '🇧🇪',
    nameFr: 'Belgique',
    apiCode: CountryCode.BE,
  );
  static const bg = RegistrationCountry._(
    iso: 'BG',
    dialingCode: '+359',
    flag: '🇧🇬',
    nameFr: 'Bulgarie',
    apiCode: CountryCode.BG,
  );
  static const hr = RegistrationCountry._(
    iso: 'HR',
    dialingCode: '+385',
    flag: '🇭🇷',
    nameFr: 'Croatie',
    apiCode: CountryCode.HR,
  );
  static const cy = RegistrationCountry._(
    iso: 'CY',
    dialingCode: '+357',
    flag: '🇨🇾',
    nameFr: 'Chypre',
    apiCode: CountryCode.CY,
  );
  static const cz = RegistrationCountry._(
    iso: 'CZ',
    dialingCode: '+420',
    flag: '🇨🇿',
    nameFr: 'Tchéquie',
    apiCode: CountryCode.CZ,
  );
  static const dk = RegistrationCountry._(
    iso: 'DK',
    dialingCode: '+45',
    flag: '🇩🇰',
    nameFr: 'Danemark',
    apiCode: CountryCode.DK,
  );
  static const ee = RegistrationCountry._(
    iso: 'EE',
    dialingCode: '+372',
    flag: '🇪🇪',
    nameFr: 'Estonie',
    apiCode: CountryCode.EE,
  );
  static const fi = RegistrationCountry._(
    iso: 'FI',
    dialingCode: '+358',
    flag: '🇫🇮',
    nameFr: 'Finlande',
    apiCode: CountryCode.FI,
  );
  static const fr = RegistrationCountry._(
    iso: 'FR',
    dialingCode: '+33',
    flag: '🇫🇷',
    nameFr: 'France',
    apiCode: CountryCode.FR,
  );
  static const de = RegistrationCountry._(
    iso: 'DE',
    dialingCode: '+49',
    flag: '🇩🇪',
    nameFr: 'Allemagne',
    apiCode: CountryCode.DE,
  );
  static const gr = RegistrationCountry._(
    iso: 'GR',
    dialingCode: '+30',
    flag: '🇬🇷',
    nameFr: 'Grèce',
    apiCode: CountryCode.GR,
  );
  static const hu = RegistrationCountry._(
    iso: 'HU',
    dialingCode: '+36',
    flag: '🇭🇺',
    nameFr: 'Hongrie',
    apiCode: CountryCode.HU,
  );
  static const ie = RegistrationCountry._(
    iso: 'IE',
    dialingCode: '+353',
    flag: '🇮🇪',
    nameFr: 'Irlande',
    apiCode: CountryCode.IE,
  );
  static const it = RegistrationCountry._(
    iso: 'IT',
    dialingCode: '+39',
    flag: '🇮🇹',
    nameFr: 'Italie',
    apiCode: CountryCode.IT,
  );
  static const lv = RegistrationCountry._(
    iso: 'LV',
    dialingCode: '+371',
    flag: '🇱🇻',
    nameFr: 'Lettonie',
    apiCode: CountryCode.LV,
  );
  static const lt = RegistrationCountry._(
    iso: 'LT',
    dialingCode: '+370',
    flag: '🇱🇹',
    nameFr: 'Lituanie',
    apiCode: CountryCode.LT,
  );
  static const lu = RegistrationCountry._(
    iso: 'LU',
    dialingCode: '+352',
    flag: '🇱🇺',
    nameFr: 'Luxembourg',
    apiCode: CountryCode.LU,
  );
  static const mt = RegistrationCountry._(
    iso: 'MT',
    dialingCode: '+356',
    flag: '🇲🇹',
    nameFr: 'Malte',
    apiCode: CountryCode.MT,
  );
  static const nl = RegistrationCountry._(
    iso: 'NL',
    dialingCode: '+31',
    flag: '🇳🇱',
    nameFr: 'Pays-Bas',
    apiCode: CountryCode.NL,
  );
  static const pl = RegistrationCountry._(
    iso: 'PL',
    dialingCode: '+48',
    flag: '🇵🇱',
    nameFr: 'Pologne',
    apiCode: CountryCode.PL,
  );
  static const pt = RegistrationCountry._(
    iso: 'PT',
    dialingCode: '+351',
    flag: '🇵🇹',
    nameFr: 'Portugal',
    apiCode: CountryCode.PT,
  );
  static const ro = RegistrationCountry._(
    iso: 'RO',
    dialingCode: '+40',
    flag: '🇷🇴',
    nameFr: 'Roumanie',
    apiCode: CountryCode.RO,
  );
  static const sk = RegistrationCountry._(
    iso: 'SK',
    dialingCode: '+421',
    flag: '🇸🇰',
    nameFr: 'Slovaquie',
    apiCode: CountryCode.SK,
  );
  static const si = RegistrationCountry._(
    iso: 'SI',
    dialingCode: '+386',
    flag: '🇸🇮',
    nameFr: 'Slovénie',
    apiCode: CountryCode.SI,
  );
  static const es = RegistrationCountry._(
    iso: 'ES',
    dialingCode: '+34',
    flag: '🇪🇸',
    nameFr: 'Espagne',
    apiCode: CountryCode.ES,
  );
  static const se = RegistrationCountry._(
    iso: 'SE',
    dialingCode: '+46',
    flag: '🇸🇪',
    nameFr: 'Suède',
    apiCode: CountryCode.SE,
  );

  static RegistrationCountry? fromIso(String? iso) {
    final upper = iso?.toUpperCase();
    if (upper == null) return null;
    for (final c in RegistrationCountries.all) {
      if (c.iso == upper) return c;
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      other is RegistrationCountry && other.iso == iso;

  @override
  int get hashCode => iso.hashCode;

  @override
  String toString() => 'RegistrationCountry($iso)';
}

/// Catalog shown on registration — DZ first, TN second, EU alpha by ISO.
abstract final class RegistrationCountries {
  static const consentVersionDz = 'dz-1.2';
  static const consentVersionTn = 'tn-1.0';
  static const consentVersionEu = 'fr-1.0';

  static const List<RegistrationCountry> all = [
    RegistrationCountry.dz,
    RegistrationCountry.tn,
    RegistrationCountry.at,
    RegistrationCountry.be,
    RegistrationCountry.bg,
    RegistrationCountry.hr,
    RegistrationCountry.cy,
    RegistrationCountry.cz,
    RegistrationCountry.dk,
    RegistrationCountry.ee,
    RegistrationCountry.fi,
    RegistrationCountry.fr,
    RegistrationCountry.de,
    RegistrationCountry.gr,
    RegistrationCountry.hu,
    RegistrationCountry.ie,
    RegistrationCountry.it,
    RegistrationCountry.lv,
    RegistrationCountry.lt,
    RegistrationCountry.lu,
    RegistrationCountry.mt,
    RegistrationCountry.nl,
    RegistrationCountry.pl,
    RegistrationCountry.pt,
    RegistrationCountry.ro,
    RegistrationCountry.sk,
    RegistrationCountry.si,
    RegistrationCountry.es,
    RegistrationCountry.se,
  ];

  static List<RegistrationCountry> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return all;
    return all
        .where(
          (c) =>
              c.iso.toLowerCase().contains(q) ||
              c.nameFr.toLowerCase().contains(q) ||
              c.dialingCode.contains(q),
        )
        .toList(growable: false);
  }
}

/// Progress indices for the registration stepper (1-based). NIN step removed.
abstract final class RegistrationSteps {
  static const int totalSteps = 6;

  static int total(RegistrationCountry? _) => totalSteps;

  static int country(RegistrationCountry? _) => 1;

  static int fullName(RegistrationCountry? _) => 2;

  static int phone(RegistrationCountry? _) => 3;

  static int password(RegistrationCountry? _) => 4;

  static int consent(RegistrationCountry? _) => 5;

  static int otp(RegistrationCountry? _) => 6;
}
