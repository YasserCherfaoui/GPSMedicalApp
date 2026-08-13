import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for PasswordResetRequest
void main() {
  final instance = PasswordResetRequestBuilder();
  // TODO add properties to the builder and call build()

  group(PasswordResetRequest, () {
    // Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // String newPassword
    test('to test the property `newPassword`', () async {
      // TODO
    });

  });
}
