import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/verification/specialist_verification.provider.dart';
import 'package:specialist_app/features/verification/specialist_verification_gate.dart';
import 'package:specialist_app/features/verification/specialist_verification_repository.dart';
import 'package:specialist_app/features/verification/specialist_verification_state.dart';
import 'package:specialist_app/routing/specialist_routes.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';
import 'package:specialist_app/screens/verification_pending_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  testWidgets(
    'rejected verification shows admin comment and resubmit navigates to credentials',
    (tester) async {
      final harness = SpecialistTestHarness()..setUpClient();
      final gate = SpecialistVerificationGate(_RejectedRepository());
      await gate.refresh();

      final router = GoRouter(
        initialLocation: SpecialistRoutes.verificationPending,
        routes: [
          GoRoute(
            path: SpecialistRoutes.verificationPending,
            builder: (context, state) => const VerificationPendingScreen(),
          ),
          GoRoute(
            path: SpecialistRoutes.credentials,
            builder: (context, state) =>
                const Scaffold(body: Text('credentials-destination')),
          ),
          GoRoute(
            path: SpecialistRoutes.profileEdit,
            builder: (context, state) =>
                const Scaffold(body: Text('profile-destination')),
          ),
        ],
      );

      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            gpsMedicalClientProvider.overrideWithValue(harness.client),
            specialistVerificationGateProvider.overrideWith((ref) => gate),
          ],
          child: MaterialApp.router(
            theme: GpsTheme.light(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('fr'),
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dossier refusé'), findsWidgets);
      expect(find.text('Documents illisibles — merci de renvoyer.'), findsOneWidget);
      final resubmit = find.text('Resoumettre mes justificatifs');
      expect(resubmit, findsOneWidget);
      await tester.ensureVisible(resubmit);
      await tester.tap(resubmit);
      await tester.pumpAndSettle();

      expect(find.text('credentials-destination'), findsOneWidget);
    },
  );
}

class _RejectedRepository extends SpecialistVerificationRepository {
  _RejectedRepository()
      : super(
          GpsMedicalClient(
            tokenStore: InMemoryTokenStore(),
            apiRootUrl: kSpecialistTestApiRoot,
          ),
        );

  @override
  Future<SpecialistVerificationState> fetch() async {
    return const SpecialistVerificationState(
      status: SpecialistVerificationStatus.rejected,
      comment: 'Documents illisibles — merci de renvoyer.',
      hasSubmittedCredentials: true,
    );
  }
}
