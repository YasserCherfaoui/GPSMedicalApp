import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'package:gps_medical_shared/src/auth/auth_exception.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

void main() {
  final repo = MockAuthRepository();

  const draft = RegistrationDraft(
    nin: '109880554003450000',
    phoneE164: '+213551234567',
    password: 'SecurePass1!',
    fullName: 'Test User',
    consentDataProcessing: true,
    consentHealthData: true,
    consentAnpdpTerms: true,
  );

  test('register succeeds with complete draft', () async {
    final response = await repo.register(
      draft: draft,
      role: GpsMedicalClientKind.patient,
    );
    expect(response.userId, isNotEmpty);
  });

  test('verifyOtp accepts mock code', () async {
    final tokens = await repo.verifyRegistrationOtp(
      phoneE164: '+213551234567',
      code: MockAuthRepository.mockOtpHint,
    );
    expect(tokens.accessToken, isNotNull);
  });

  test('verifyOtp rejects wrong code', () async {
    expect(
      () => repo.verifyRegistrationOtp(
        phoneE164: '+213551234567',
        code: '000000',
      ),
      throwsA(isA<AuthUnauthorizedException>()),
    );
  });

  test('login rejects short password', () async {
    expect(
      () => repo.login(phoneE164: '+213551234567', password: 'short'),
      throwsA(isA<AuthUnauthorizedException>()),
    );
  });

  test('register throws network error when configured', () async {
    final failing = MockAuthRepository()..failNextCall = true;
    expect(
      () => failing.register(draft: draft, role: GpsMedicalClientKind.patient),
      throwsA(isA<AuthNetworkException>()),
    );
  });
}
