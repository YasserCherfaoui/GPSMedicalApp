import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/appointments/screens/appointments_calendar_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockEmptyAppointments();
    harness.mockEmptySchedule();
  });

  testWidgets('calendar shows month week toggle and empty day list', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(
        const Scaffold(body: AppointmentsCalendarScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mois'), findsOneWidget);
    expect(find.text('Semaine'), findsOneWidget);

    await tester.tap(find.text('Semaine'));
    await tester.pumpAndSettle();
    expect(find.text('Semaine'), findsOneWidget);
  });
}
