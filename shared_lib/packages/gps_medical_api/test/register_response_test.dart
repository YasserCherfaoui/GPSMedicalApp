import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for RegisterResponse
void main() {
  final instance = RegisterResponseBuilder();
  // TODO add properties to the builder and call build()

  group(RegisterResponse, () {
    // String userId
    test('to test the property `userId`', () async {
      // TODO
    });

    // DateTime otpExpiresAt
    test('to test the property `otpExpiresAt`', () async {
      // TODO
    });

    // Pour les nouvelles inscriptions (v1.2.8) : toujours `not_required` (collecte NIN retirée). Valeurs historiques `pending` / `verified` / `failed` peuvent encore apparaître sur d'anciens comptes. 
    // String ninVerificationStatus
    test('to test the property `ninVerificationStatus`', () async {
      // TODO
    });

  });
}
