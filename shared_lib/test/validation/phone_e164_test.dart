import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  group('PhoneE164', () {
    test('accepts DZ national digits', () {
      expect(
        PhoneE164.validateNationalInput(RegistrationCountry.dz, '551234567'),
        '+213551234567',
      );
    });

    test('accepts TN national digits', () {
      expect(
        PhoneE164.validateNationalInput(RegistrationCountry.tn, '22123456'),
        '+21622123456',
      );
    });

    test('rejects DZ prefix on TN country', () {
      expect(
        PhoneE164.matchesCountry('+213551234567', RegistrationCountry.tn),
        isFalse,
      );
    });

    test('rejects TN prefix on DZ country', () {
      expect(
        PhoneE164.matchesCountry('+21622123456', RegistrationCountry.dz),
        isFalse,
      );
    });

    test('rejects invalid TN operator prefix', () {
      expect(
        PhoneE164.validateNationalInput(RegistrationCountry.tn, '32123456'),
        isNull,
      );
    });
  });
}
