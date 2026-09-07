import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for ConciergeAccountCreate
void main() {
  final instance = ConciergeAccountCreateBuilder();
  // TODO add properties to the builder and call build()

  group(ConciergeAccountCreate, () {
    // Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

    // String password
    test('to test the property `password`', () async {
      // TODO
    });

  });
}
