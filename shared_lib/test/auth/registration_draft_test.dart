import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

void main() {
  const dzComplete = RegistrationDraft(
    country: RegistrationCountry.dz,
    phoneE164: '+213551234567',
    password: 'SecurePass1!',
    fullName: 'Amine Test',
    consentDataProcessing: true,
    consentHealthData: true,
    consentAnpdpTerms: true,
  );

  test('readyToRegister for DZ without NIN', () {
    expect(dzComplete.readyToRegister, isTrue);
  });

  test('readyToRegister for TN without NIN', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.tn,
      phoneE164: '+21622123456',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isTrue);
  });

  test('readyToRegister for FR without NIN', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.fr,
      phoneE164: '+33612345678',
      password: 'SecurePass1!',
      fullName: 'Jean Dupont',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isTrue);
  });

  test('not ready without consents', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.dz,
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('not ready without full name', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.dz,
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('not ready without country', () {
    const draft = RegistrationDraft(
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('copyWith can clear phone', () {
    final cleared = dzComplete.copyWith(clearPhone: true);
    expect(cleared.phoneE164, isNull);
    expect(cleared.country, RegistrationCountry.dz);
  });

  test('RegistrationSteps are fixed at 6 (NIN removed)', () {
    expect(RegistrationSteps.total(RegistrationCountry.dz), 6);
    expect(RegistrationSteps.total(RegistrationCountry.tn), 6);
    expect(RegistrationSteps.total(RegistrationCountry.fr), 6);
    expect(RegistrationSteps.fullName(RegistrationCountry.dz), 2);
    expect(RegistrationSteps.phone(RegistrationCountry.fr), 3);
  });

  test('EU consent version is fr-1.0', () {
    expect(
      RegistrationCountry.fr.consentPolicyVersion,
      RegistrationCountries.consentVersionEu,
    );
    expect(RegistrationCountry.dz.requiresNin, isFalse);
  });
}
