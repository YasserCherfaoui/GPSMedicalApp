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

    test('accepts FR national digits', () {
      expect(
        PhoneE164.validateNationalInput(RegistrationCountry.fr, '612345678'),
        '+33612345678',
      );
    });

    test('rejects DZ prefix on FR country', () {
      expect(
        PhoneE164.matchesCountry('+213551234567', RegistrationCountry.fr),
        isFalse,
      );
    });

    test('rejects FR prefix on DZ country', () {
      expect(
        PhoneE164.matchesCountry('+33612345678', RegistrationCountry.dz),
        isFalse,
      );
    });

    test('rejects DZ prefix on TN country', () {
      expect(
        PhoneE164.matchesCountry('+213551234567', RegistrationCountry.tn),
        isFalse,
      );
    });

    test('MT sample matches', () {
      expect(
        PhoneE164.matchesCountry('+35699123456', RegistrationCountry.mt),
        isTrue,
      );
    });
  });
}
