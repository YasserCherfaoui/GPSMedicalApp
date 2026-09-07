import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:intl/intl.dart';

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
///
/// [languageCode] only affects EUR (locale-aware `NumberFormat`); DZD/TND stay
/// as `{amount} {code}`.
String formatMoneyMajor({
  required int amount,
  required String currency,
  String? languageCode,
}) {
  final code = currency.trim().toUpperCase();
  if (code == 'EUR') {
    final locale = switch (languageCode) {
      'ar' => 'ar',
      'fr' => 'fr_FR',
      'en' => 'en_IE',
      _ => 'fr_FR',
    };
    return NumberFormat.currency(
      locale: locale,
      symbol: '€',
      decimalDigits: 0,
    ).format(amount);
  }
  return '$amount ${code.isEmpty ? 'DZD' : code}';
}
