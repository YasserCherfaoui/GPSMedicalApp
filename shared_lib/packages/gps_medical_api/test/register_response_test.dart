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

    // État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
    // String ninVerificationStatus
    test('to test the property `ninVerificationStatus`', () async {
      // TODO
    });

  });
}
