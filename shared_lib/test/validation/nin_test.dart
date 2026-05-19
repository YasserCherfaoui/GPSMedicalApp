import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  group('NinValidator', () {
    test('accepts 18-digit NIN starting with 1 or 2', () {
      expect(NinValidator.validate('109880554003450000'), '109880554003450000');
    });

    test('rejects wrong length', () {
      expect(NinValidator.validate('123'), isNull);
    });
  });
}
