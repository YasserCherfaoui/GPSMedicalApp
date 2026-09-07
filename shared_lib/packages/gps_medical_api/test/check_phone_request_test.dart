import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for CheckPhoneRequest
void main() {
  final instance = CheckPhoneRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CheckPhoneRequest, () {
    // Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // Doit correspondre à l'indicatif du `phone` (libphonenumber) — sinon `422 phone_country_mismatch`. 
    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

  });
}
