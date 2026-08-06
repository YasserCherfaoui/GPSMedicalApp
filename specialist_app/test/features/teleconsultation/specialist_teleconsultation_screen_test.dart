import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/teleconsultation/screens/specialist_teleconsultation_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const appointmentId = '00000000-0000-4000-8000-000000000099';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    // Far-future slot → window closed → countdown UI (no WebRTC).
    final start = DateTime.now().toUtc().add(const Duration(days: 2));
    final end = start.add(const Duration(minutes: 30));
    harness.adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(
        200,
        minimalAppointmentJson(
          id: appointmentId,
          status: 'confirmed',
          mode: 'telehealth',
          startAt: start.toIso8601String(),
          endAt: end.toIso8601String(),
        ),
      );
    });
  });

  testWidgets('teleconsult shows waiting countdown when window closed', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistTeleconsultationScreen(appointmentId: appointmentId),
        extraRoutes: [
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text("La session n'est pas encore ouverte."), findsOneWidget);
    // Countdown text is set on the first periodic tick (1s).
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('Ouverture dans'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 2));
  });
}
