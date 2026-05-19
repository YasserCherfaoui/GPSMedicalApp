import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

void main() {
  test('readyToRegister when all required fields set', () {
    const draft = RegistrationDraft(
      nin: '109880554003450000',
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
      consentDataProcessing: true,
      consentHealthData: true,
      consentAnpdpTerms: true,
    );
    expect(draft.readyToRegister, isTrue);
  });

  test('not ready without consents', () {
    const draft = RegistrationDraft(
      nin: '109880554003450000',
      phoneE164: '+213551234567',
      password: 'SecurePass1!',
    );
    expect(draft.readyToRegister, isFalse);
  });
}
