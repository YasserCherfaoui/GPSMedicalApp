import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/verification/specialist_verification.provider.dart';
import 'package:specialist_app/features/verification/specialist_verification_repository.dart';
import 'package:specialist_app/features/verification/specialist_verification_state.dart';
import 'package:specialist_app/main.dart';
import 'package:specialist_app/routing/specialist_router.provider.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';
import 'package:specialist_app/screens/verification_pending_screen.dart';

const _specialistAppInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Spécialiste',
  clientKind: GpsMedicalClientKind.specialist,
);

void main() {
  testWidgets(
    'authenticated specialist is redirected to verification pending',
    (tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final launchPrefs = InMemoryAppLaunchPreferences();
      await launchPrefs.setOnboardingCompleted(true);

      final container = ProviderContainer(
        overrides: [
          appInfoProvider.overrideWithValue(_specialistAppInfo),
          tokenStoreProvider.overrideWithValue(InMemoryTokenStore()),
          appLaunchPreferencesProvider.overrideWithValue(launchPrefs),
          specialistVerificationRepositoryProvider.overrideWith((ref) {
            return _PendingVerificationRepository();
          }),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const SpecialistApp(),
        ),
      );
      await tester.pumpAndSettle();

      await container
          .read(authSessionProvider)
          .signIn(
            TokenPair(
              (b) => b
                ..accessToken = 'access'
                ..refreshToken = 'refresh'
                ..expiresIn = 3600,
            ),
          );

      final router = container.read(specialistRouterProvider);
      router.go(GpsRoutes.profile);
      await tester.pumpAndSettle();

      expect(find.byType(VerificationPendingScreen), findsOneWidget);
    },
  );
}

class _PendingVerificationRepository extends SpecialistVerificationRepository {
  _PendingVerificationRepository()
    : super(
        GpsMedicalClient(
          tokenStore: InMemoryTokenStore(),
          apiRootUrl: 'http://localhost:8080',
        ),
      );

  @override
  Future<SpecialistVerificationState> fetch() async {
    return const SpecialistVerificationState(
      status: SpecialistVerificationStatus.pending,
    );
  }
}
