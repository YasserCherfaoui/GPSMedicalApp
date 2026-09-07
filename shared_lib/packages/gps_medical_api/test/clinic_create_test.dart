import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for ClinicCreate
void main() {
  final instance = ClinicCreateBuilder();
  // TODO add properties to the builder and call build()

  group(ClinicCreate, () {
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // String legalName
    test('to test the property `legalName`', () async {
      // TODO
    });

    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // ISO 3166-1 alpha-2. DZ, TN, et codes UE-27. G-3 cleared (Amendment 2): approve active DZ + UE ; TN reste `approved_pending_activation` (G-2). 
    // String countryCode
    test('to test the property `countryCode`', () async {
      // TODO
    });

    // Requis pour `country_code=DZ` ; ignorer / omettre sinon.
    // String wilayaCode
    test('to test the property `wilayaCode`', () async {
      // TODO
    });

    // DZ uniquement ; optionnel sinon.
    // String communeId
    test('to test the property `communeId`', () async {
      // TODO
    });

    // Ville libre — recommandée hors DZ (persistée comme libellé géo).
    // String city
    test('to test the property `city`', () async {
      // TODO
    });

    // String addressLine1
    test('to test the property `addressLine1`', () async {
      // TODO
    });

    // String addressLine2
    test('to test the property `addressLine2`', () async {
      // TODO
    });

    // double latitude
    test('to test the property `latitude`', () async {
      // TODO
    });

    // double longitude
    test('to test the property `longitude`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // String registreCommerce
    test('to test the property `registreCommerce`', () async {
      // TODO
    });

    // String agrementSante
    test('to test the property `agrementSante`', () async {
      // TODO
    });

    // String confirmationPolicy (default value: 'manual')
    test('to test the property `confirmationPolicy`', () async {
      // TODO
    });

  });
}
