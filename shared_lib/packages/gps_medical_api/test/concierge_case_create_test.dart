import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for ConciergeCaseCreate
void main() {
  final instance = ConciergeCaseCreateBuilder();
  // TODO add properties to the builder and call build()

  group(ConciergeCaseCreate, () {
    // String patientUserId
    test('to test the property `patientUserId`', () async {
      // TODO
    });

    // Requis pour admin ; ignoré si l'appelant est concierge (auto-assignation).
    // String conciergeUserId
    test('to test the property `conciergeUserId`', () async {
      // TODO
    });

    // String note
    test('to test the property `note`', () async {
      // TODO
    });

  });
}
