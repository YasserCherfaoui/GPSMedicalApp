import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/discovery/utils/search_suggestion_utils.dart';

void main() {
  group('isWilayaCode', () {
    test('accepts padded and unpadded wilaya codes', () {
      expect(isWilayaCode('16'), isTrue);
      expect(isWilayaCode('1'), isTrue);
      expect(isWilayaCode('58'), isTrue);
    });

    test('rejects commune UUIDs', () {
      expect(isWilayaCode('5fcffb1c-ad63-4de0-b594-9f3a8c8f1a2b'), isFalse);
    });
  });

  group('parseWilayaNameFromSuggestLabel', () {
    test('extracts wilaya name from backend label format', () {
      expect(parseWilayaNameFromSuggestLabel('Hydra (Alger)'), 'Alger');
      expect(parseWilayaNameFromSuggestLabel('Oran (Oran)'), 'Oran');
    });

    test('returns null when parentheses are missing', () {
      expect(parseWilayaNameFromSuggestLabel('Alger'), isNull);
      expect(parseWilayaNameFromSuggestLabel(null), isNull);
    });
  });
}
