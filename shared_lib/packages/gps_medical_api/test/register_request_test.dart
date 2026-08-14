import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for RegisterRequest
void main() {
  final instance = RegisterRequestBuilder();
  // TODO add properties to the builder and call build()

  group(RegisterRequest, () {
    // Pays du compte. Obligatoire. Immuable après OTP. 
    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

    // Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // Obligatoire si `country=DZ` (`422 nin_required` si absent). Doit être absent si `country=TN` (`422 nin_not_applicable` sinon). 
    // String nin
    test('to test the property `nin`', () async {
      // TODO
    });

    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // `patient` ou `specialist`. `specialist` + `country=TN` est accepté (v1.1.1) ; l'activation marché est une étape séparée. 
    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // Consentement obligatoire au traitement des données personnelles (termes légaux du pays).
    // bool consentDataProcessing
    test('to test the property `consentDataProcessing`', () async {
      // TODO
    });

    // Consentement obligatoire au traitement des données de santé.
    // bool consentHealthData
    test('to test the property `consentHealthData`', () async {
      // TODO
    });

    // Acceptation des conditions légales applicables au pays de l'utilisateur (libellé historique `anpdp_terms` — rename cosmétique différé). 
    // bool consentAnpdpTerms
    test('to test the property `consentAnpdpTerms`', () async {
      // TODO
    });

    // Optionnel — communications marketing (révocable sans suspension de compte).
    // bool consentMarketing
    test('to test the property `consentMarketing`', () async {
      // TODO
    });

  });
}
