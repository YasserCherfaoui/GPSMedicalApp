import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  group('AlgerianPhone', () {
    test('validates national digits', () {
      expect(AlgerianPhone.validateNationalInput('551234567'), '+213551234567');
    });

    test('rejects invalid prefix', () {
      expect(AlgerianPhone.validateNationalInput('451234567'), isNull);
    });

    test('rejects short input', () {
      expect(AlgerianPhone.validateNationalInput('55123'), isNull);
    });
  });
}
