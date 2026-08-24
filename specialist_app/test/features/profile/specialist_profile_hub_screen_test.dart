import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/profile/screens/specialist_profile_hub_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockDoctorMe();
  });

  testWidgets('profile hub shows edit and schedule shortcuts', (tester) async {
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistProfileHubScreen(),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.profileEdit,
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.scheduleEdit,
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.credentials,
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.notifications,
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.clinicMemberships,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Dr. Test Specialist'), findsOneWidget);
    expect(find.text('Modifier mon profil'), findsOneWidget);
    expect(find.text('Affiliations cliniques'), findsOneWidget);
  });
}
