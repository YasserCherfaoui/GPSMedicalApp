import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/credentials/screens/credentials_submission_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  testWidgets('credentials screen shows empty form without existing files', (
    tester,
  ) async {
    harness.mockDoctorMe(
      minimalDoctorProfile(
        verificationStatus: 'pending',
        credentials: const [],
      ),
    );
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const CredentialsSubmissionScreen(),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.verificationPending,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Justificatifs professionnels'), findsOneWidget);
    expect(find.text('Soumettre pour vérification'), findsOneWidget);

    await tester.ensureVisible(find.text('Soumettre pour vérification'));
    await tester.tap(find.text('Soumettre pour vérification'));
    await tester.pumpAndSettle();
    expect(find.text('Ajoutez au moins un justificatif.'), findsOneWidget);
  });

  testWidgets('credentials screen lists existing credentials', (tester) async {
    harness.mockDoctorMe(
      minimalDoctorProfile(
        verificationStatus: 'rejected',
        credentials: [
          {
            'id': '00000000-0000-4000-8000-000000000030',
            'type': 'diploma',
            'status': 'rejected',
            'rejection_reason': 'Illisible',
            'created_at': '2026-06-01T00:00:00Z',
          },
          {
            'id': '00000000-0000-4000-8000-000000000031',
            'type': 'council_card',
            'status': 'pending',
            'created_at': '2026-06-02T00:00:00Z',
          },
        ],
      ),
    );
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const CredentialsSubmissionScreen(),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.verificationPending,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Justificatifs déjà envoyés'), findsOneWidget);
    expect(find.text('Diplôme'), findsWidgets);
    expect(find.text("Carte du Conseil de l'Ordre"), findsWidgets);
    expect(find.text('Refusé'), findsWidgets);
    expect(find.text('En attente'), findsWidgets);
  });
}
