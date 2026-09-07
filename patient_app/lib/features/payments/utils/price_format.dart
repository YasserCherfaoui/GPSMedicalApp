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
