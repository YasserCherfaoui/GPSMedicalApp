import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('catalog currency by seller country', () {
    expect(catalogCurrencyForSellerCountry(CountryCode.DZ), 'DZD');
    expect(catalogCurrencyForSellerCountry(CountryCode.TN), 'DZD');
    expect(catalogCurrencyForSellerCountry(CountryCode.FR), 'EUR');
    expect(catalogCurrencyForSellerCountry(CountryCode.DE), 'EUR');
    expect(catalogCurrencyForSellerCountry(null), 'DZD');
  });

  test('catalog currency by ISO country string', () {
    expect(catalogCurrencyForCountryIso('DZ'), 'DZD');
    expect(catalogCurrencyForCountryIso('tn'), 'DZD');
    expect(catalogCurrencyForCountryIso('FR'), 'EUR');
    expect(catalogCurrencyForCountryIso(null), 'DZD');
  });

  test('formatMoneyMajor EUR and DZD', () {
    final eur = formatMoneyMajor(amount: 80, currency: 'EUR');
    expect(eur.contains('80'), isTrue);
    expect(eur.contains('€'), isTrue);
    expect(formatMoneyMajor(amount: 3500, currency: 'DZD'), '3500 DZD');
  });
}
