import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

void main() {
  const dzComplete = RegistrationDraft(
    country: RegistrationCountry.dz,
    nin: '109880554003450000',
    phoneE164: '+213551234567',
    password: 'SecurePass1!',
    fullName: 'Amine Test',
    consentDataProcessing: true,
    consentHealthData: true,
    consentAnpdpTerms: true,
  );

  test('readyToRegister when DZ fields include NIN', () {
    expect(dzComplete.readyToRegister, isTrue);
  });

  test('readyToRegister when TN fields omit NIN', () {
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

  test('not ready for DZ without NIN', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.dz,
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('not ready without consents', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.dz,
      nin: '109880554003450000',
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('not ready without full name', () {
    const draft = RegistrationDraft(
      country: RegistrationCountry.dz,
      nin: '109880554003450000',
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
      nin: '109880554003450000',
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      fullName: 'Amine Test',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isFalse);
  });

  test('copyWith can clear nin and phone', () {
    final cleared = dzComplete.copyWith(clearNin: true, clearPhone: true);
    expect(cleared.nin, isNull);
    expect(cleared.phoneE164, isNull);
    expect(cleared.country, RegistrationCountry.dz);
  });

  test('RegistrationSteps skip NIN for Tunisia', () {
    expect(RegistrationSteps.total(RegistrationCountry.dz), 7);
    expect(RegistrationSteps.total(RegistrationCountry.tn), 6);
    expect(RegistrationSteps.fullName(RegistrationCountry.tn), 2);
    expect(RegistrationSteps.nin(RegistrationCountry.dz), 2);
  });
}
