import 'package:intl/intl.dart';

/// Formats a major-unit amount for discovery / booking display.
///
/// DZD and TND keep the existing plain `{amount} {code}` style.
/// EUR uses a locale-aware currency format (no minor units — clinic
/// `price_amount` is whole euros).
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

/// Rounded indicative quote amount (display-only).
int indicativeQuoteAmount({
  required int baseAmount,
  required double rate,
}) {
  if (rate <= 0) return 0;
  return (baseAmount * rate).round();
}

/// True when the charged currency is EUR (K-4 caveat applies).
bool isEurCurrency(String? currency) =>
    currency != null && currency.trim().toUpperCase() == 'EUR';
