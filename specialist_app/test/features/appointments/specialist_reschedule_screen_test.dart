import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/appointments/screens/specialist_reschedule_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const appointmentId = '00000000-0000-4000-8000-000000000099';
  const doctorId = '00000000-0000-4000-8000-000000000010';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockDoctorMe(minimalDoctorProfile(id: doctorId));
    harness.adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(
        200,
        minimalAppointmentJson(
          id: appointmentId,
          status: 'confirmed',
        ),
      );
    });
    harness.adapter.onGet('/doctors/$doctorId/availability', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
  });

  testWidgets('reschedule screen shows empty slots state', (tester) async {
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistRescheduleScreen(appointmentId: appointmentId),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.appointmentDetail(appointmentId),
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Reporter'), findsOneWidget);
    expect(find.text('Aucun créneau'), findsOneWidget);
  });
}
