import 'package:gps_medical_api/gps_medical_api.dart';

/// Catalog / display currency for a seller country (OpenAPI 1.2.9 / Phase 6.1).
String catalogCurrencyForSellerCountry(CountryCode? country) {
  if (country == null) return 'DZD';
  switch (country) {
    case CountryCode.DZ:
    case CountryCode.TN:
      return 'DZD';
    default:
      return 'EUR';
  }
}

bool isEurSellerCountry(CountryCode? country) =>
    catalogCurrencyForSellerCountry(country) == 'EUR';

/// Formats a major-unit amount for discovery cards and profile forms.
///
/// Clinic `price_amount` and specialist `consultation_fee_dzd` are treated as
/// whole major units (DZD dinars or EUR euros — not Stripe cents).
String formatMoneyMajor({
  required int amount,
  required String currency,
}) {
  final code = currency.trim().toUpperCase();
  if (code == 'EUR') {
    return '$amount €';
  }
  return '$amount ${code.isEmpty ? 'DZD' : code}';
}
