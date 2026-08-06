import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/prescriptions/screens/specialist_prescription_compose_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const appointmentId = '00000000-0000-4000-8000-000000000099';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(
        200,
        minimalAppointmentJson(id: appointmentId, status: 'confirmed'),
      );
    });
  });

  testWidgets('prescription compose shows diagnosis and drug fields', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistPrescriptionComposeScreen(
          appointmentId: appointmentId,
        ),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.appointmentDetail(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Ordonnance'), findsOneWidget);
    expect(find.text('Diagnostic'), findsOneWidget);
    expect(find.text('Médicaments'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text("Émettre l'ordonnance"),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text("Émettre l'ordonnance"), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'Rhume');
    await tester.tap(find.text("Émettre l'ordonnance"));
    await tester.pumpAndSettle();
    expect(find.textContaining('médicament'), findsWidgets);
  });
}
