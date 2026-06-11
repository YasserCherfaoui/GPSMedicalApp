import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:gps_medical_shared/src/auth/registration_draft.dart';

class _SuccessAuthRepository implements AuthRepository {
  GpsMedicalClientKind? lastRegisterRole;
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
    lastRegisterRole = role;
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

  testWidgets(
    'register submits role=specialist when client kind is specialist',
    (tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repo = _SuccessAuthRepository();
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWith((ref) => repo),
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'Test Specialist',
              clientKind: GpsMedicalClientKind.specialist,
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      container.read(registrationDraftProvider.notifier)
        ..updateNin('109880554003450000')
        ..updateFullName('Dr. Test')
        ..updatePhone('+213555123456')
        ..updatePassword('SecurePass123!')
        ..updateConsents(
          dataProcessing: true,
          healthData: true,
          anpdpTerms: true,
        );

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const RegisterConsentScreen(),
          ),
          GoRoute(
            path: GpsRoutes.registerOtp,
            builder: (context, state) =>
                const Scaffold(body: Text('otp-placeholder')),
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            localizationsDelegates: const [AuthStrings.delegate],
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(Switch).at(2));
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Créer mon compte'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(repo.lastRegisterRole, GpsMedicalClientKind.specialist);
    },
  );
}
