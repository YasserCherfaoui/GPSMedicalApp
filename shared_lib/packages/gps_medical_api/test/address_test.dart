import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for Address
void main() {
  final instance = AddressBuilder();
  // TODO add properties to the builder and call build()

  group(Address, () {
    // String line1
    test('to test the property `line1`', () async {
      // TODO
    });

    // String line2
    test('to test the property `line2`', () async {
      // TODO
    });

    // Pays de l'adresse (optionnel).
    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

    // Ville en texte libre — utilisé pour l'offre non-DZ (UE) où wilaya / commune ne s'appliquent pas. 
    // String city
    test('to test the property `city`', () async {
      // TODO
    });

    // Identifiant commune — **DZ uniquement** ; optionnel sinon.
    // String communeId
    test('to test the property `communeId`', () async {
      // TODO
    });

    // String communeName
    test('to test the property `communeName`', () async {
      // TODO
    });

    // Code wilaya — **DZ uniquement** ; optionnel sinon.
    // String wilayaCode
    test('to test the property `wilayaCode`', () async {
      // TODO
    });

    // String wilayaName
    test('to test the property `wilayaName`', () async {
      // TODO
    });

    // String postalCode
    test('to test the property `postalCode`', () async {
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

  });
}
