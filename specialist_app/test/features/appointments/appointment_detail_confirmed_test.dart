import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/appointments/screens/appointment_detail_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const appointmentId = '00000000-0000-4000-8000-000000000099';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockDoctorMe();
    harness.adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(
        200,
        minimalAppointmentJson(
          id: appointmentId,
          status: 'confirmed',
          mode: 'telehealth',
        ),
      );
    });
    harness.mockEmptyAppointments();
  });

  testWidgets('confirmed telehealth detail shows action shortcuts', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        SpecialistAppointmentDetailScreen(appointmentId: appointmentId),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.appointmentReschedule(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.patientRecords(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.prescriptionCompose(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.teleconsultation(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Détail du rendez-vous'), findsOneWidget);
    expect(find.text('Téléconsultation'), findsWidgets);
  });
}
