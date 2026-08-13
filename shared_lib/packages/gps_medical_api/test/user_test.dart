import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for User
void main() {
  //final instance = UserBuilder();
  // TODO add properties to the builder and call build()

  group(User, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Fixé à l'inscription ; jamais mutable via l'API.
    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

    // Dérivé de `country` : `DZ` → `device_only`, `TN` → `server`. 
    // DataResidencyMode dataResidencyMode
    test('to test the property `dataResidencyMode`', () async {
      // TODO
    });

    // DateTime createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });

  });
}
