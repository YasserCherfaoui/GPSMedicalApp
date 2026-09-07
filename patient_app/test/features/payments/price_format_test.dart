import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/payments/utils/price_format.dart';

void main() {
  group('formatMoneyMajor', () {
    test('keeps plain DZD / TND labels', () {
      expect(
        formatMoneyMajor(amount: 3500, currency: 'DZD'),
        '3500 DZD',
      );
      expect(
        formatMoneyMajor(amount: 80, currency: 'TND'),
        '80 TND',
      );
    });

    test('formats EUR with euro symbol', () {
      final fr = formatMoneyMajor(
        amount: 45,
        currency: 'EUR',
        languageCode: 'fr',
      );
      expect(fr.contains('45'), isTrue);
      expect(fr.contains('€'), isTrue);
    });
  });

  group('indicativeQuoteAmount', () {
    test('rounds base × rate', () {
      expect(
        indicativeQuoteAmount(baseAmount: 45, rate: 260.5),
        11723,
      );
    });

    test('returns 0 for non-positive rate', () {
      expect(indicativeQuoteAmount(baseAmount: 45, rate: 0), 0);
    });
  });

  test('isEurCurrency', () {
    expect(isEurCurrency('EUR'), isTrue);
    expect(isEurCurrency('eur'), isTrue);
    expect(isEurCurrency('DZD'), isFalse);
    expect(isEurCurrency(null), isFalse);
  });
}
