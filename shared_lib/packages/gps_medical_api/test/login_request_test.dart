import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for LoginRequest
void main() {
  final instance = LoginRequestBuilder();
  // TODO add properties to the builder and call build()

  group(LoginRequest, () {
    // Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // `dashboard` — connexion réservée au tableau de bord (`admin` / `moderator` / `clinic_owner` / `clinic_admin`). 
    // String client (default value: 'mobile')
    test('to test the property `client`', () async {
      // TODO
    });

  });
}
