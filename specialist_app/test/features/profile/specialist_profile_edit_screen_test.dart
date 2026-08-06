import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/profile/screens/specialist_profile_edit_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockDoctorMe();
    harness.mockSpecialties();
    harness.mockEmptyWilayas();
  });

  testWidgets('profile edit seeds fields and opens specialty picker', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistProfileEditScreen(),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Modifier mon profil'), findsOneWidget);
    expect(find.text('Test Specialist'), findsOneWidget);
    expect(find.text('Bio test'), findsOneWidget);
    expect(find.text('Enregistrer'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Spécialité principale'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Spécialité principale'));
    await tester.pumpAndSettle();
    expect(find.text('Cardiologie'), findsWidgets);
    await tester.tap(find.text('Cardiologie').last);
    await tester.pumpAndSettle();

    harness.adapter.onPatch('/doctors/me', (server) {
      return server.reply(200, minimalDoctorProfile());
    });
    await tester.scrollUntilVisible(
      find.text('Enregistrer'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Enregistrer'));
    await tester.pumpAndSettle();
  });
}
