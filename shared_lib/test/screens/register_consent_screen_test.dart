import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

class _SuccessAuthRepository implements AuthRepository {
  @override
  Future<void> forgotPassword({required String phoneE164}) async {}

  @override
  Future<TokenPair> login({
    required String phoneE164,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> register({
    required RegistrationDraft draft,
    required GpsMedicalClientKind role,
  }) async {
    return RegisterResponse(
      (b) => b
        ..userId = '00000000-0000-4000-8000-000000000001'
        ..otpExpiresAt = DateTime.now().add(const Duration(minutes: 5))
        ..ninVerificationStatus =
            RegisterResponseNinVerificationStatusEnum.pending,
    );
  }

  @override
  Future<void> resendOtp({required String phoneE164}) async {}

  @override
  Future<TokenPair> resetPassword({
    required String phoneE164,
    required String code,
    required String newPassword,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<TokenPair> verifyRegistrationOtp({
    required String phoneE164,
    required String code,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> checkRegisterNin(String nin) async {}

  @override
  Future<void> checkRegisterPhone(String phoneE164) async {}
}

void main() {
  testWidgets('consent screen requires CGU checkbox before submit', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWith(
            (ref) => _SuccessAuthRepository(),
          ),
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'Test',
              clientKind: GpsMedicalClientKind.patient,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [AuthStrings.delegate],
          home: RegisterConsentScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Créer mon compte'), findsOneWidget);

    await tester.tap(find.text('Créer mon compte'));
    await tester.pump();
    expect(find.byType(RegisterConsentScreen), findsOneWidget);
  });
}
