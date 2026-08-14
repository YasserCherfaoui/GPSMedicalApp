import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for DoctorPrivate
void main() {
  final instance = DoctorPrivateBuilder();
  // TODO add properties to the builder and call build()

  group(DoctorPrivate, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // String gender
    test('to test the property `gender`', () async {
      // TODO
    });

    // String photoUrl
    test('to test the property `photoUrl`', () async {
      // TODO
    });

    // String bio
    test('to test the property `bio`', () async {
      // TODO
    });

    // BuiltList<Specialty> specialties
    test('to test the property `specialties`', () async {
      // TODO
    });

    // BuiltList<String> languages
    test('to test the property `languages`', () async {
      // TODO
    });

    // int consultationFeeDzd
    test('to test the property `consultationFeeDzd`', () async {
      // TODO
    });

    // bool acceptsCnas
    test('to test the property `acceptsCnas`', () async {
      // TODO
    });

    // bool acceptsCasnos
    test('to test the property `acceptsCasnos`', () async {
      // TODO
    });

    // bool offersTelehealth
    test('to test the property `offersTelehealth`', () async {
      // TODO
    });

    // Address practiceAddress
    test('to test the property `practiceAddress`', () async {
      // TODO
    });

    // double ratingAverage
    test('to test the property `ratingAverage`', () async {
      // TODO
    });

    // int ratingCount
    test('to test the property `ratingCount`', () async {
      // TODO
    });

    // bool verified
    test('to test the property `verified`', () async {
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

    // Pays du compte médecin (lecture seule, issu de `auth.users`). 
    // CountryCode country
    test('to test the property `country`', () async {
      // TODO
    });

    // N° au Conseil de l'Ordre
    // String councilNumber
    test('to test the property `councilNumber`', () async {
      // TODO
    });

    // DoctorVerificationStatus verificationStatus
    test('to test the property `verificationStatus`', () async {
      // TODO
    });

    // Admin feedback from the verification decision (more_info / rejected).
    // String verificationComment
    test('to test the property `verificationComment`', () async {
      // TODO
    });

    // BuiltList<Credential> credentials
    test('to test the property `credentials`', () async {
      // TODO
    });

    // String confirmationPolicy
    test('to test the property `confirmationPolicy`', () async {
      // TODO
    });

    // int bookingWindowDays
    test('to test the property `bookingWindowDays`', () async {
      // TODO
    });

  });
}
