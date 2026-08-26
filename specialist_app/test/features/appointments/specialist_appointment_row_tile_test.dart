import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/appointments/widgets/specialist_appointment_row_tile.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  testWidgets('row tile shows patient label mode status and fee', (
    tester,
  ) async {
    var tapped = false;
    final appointment = Appointment((b) {
      b
        ..id = '00000000-0000-4000-8000-000000000099'
        ..patientId = '00000000-0000-4000-8000-000000000050'
        ..status = AppointmentStatusEnum.confirmed
        ..mode = AppointmentModeEnum.inPerson
        ..startAt = DateTime.parse('2026-06-20T09:00:00Z')
        ..endAt = DateTime.parse('2026-06-20T09:30:00Z')
        ..feeDzd = 2500
        ..reason = 'Douleur thoracique';
    });

    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SpecialistAppointmentRowTile(
            appointment: appointment,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Patient ····0050'), findsOneWidget);
    expect(find.text('2500 DZD'), findsOneWidget);
    expect(find.text('Confirmé'), findsOneWidget);
    expect(find.text('En présentiel'), findsOneWidget);
    expect(find.text('Douleur thoracique'), findsOneWidget);

    await tester.tap(find.byType(SpecialistAppointmentRowTile));
    await tester.pump();
    expect(tapped, isTrue);
  });

  testWidgets('pending row uses anonymous patient label', (tester) async {
    final appointment = Appointment((b) {
      b
        ..id = '00000000-0000-4000-8000-000000000098'
        ..status = AppointmentStatusEnum.pending
        ..mode = AppointmentModeEnum.telehealth
        ..startAt = DateTime.parse('2026-06-21T10:00:00Z')
        ..feeDzd = 3000;
    });

    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SpecialistAppointmentRowTile(
            appointment: appointment,
            onTap: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Patient (identité masquée)'), findsOneWidget);
    expect(find.text('Téléconsultation'), findsOneWidget);
    expect(find.text('En attente'), findsOneWidget);
  });

  testWidgets('clinic-origin appointment shows clinic session badge', (
    tester,
  ) async {
    final appointment = Appointment((b) {
      b
        ..id = '00000000-0000-4000-8000-000000000097'
        ..patientId = '00000000-0000-4000-8000-000000000050'
        ..status = AppointmentStatusEnum.confirmed
        ..mode = AppointmentModeEnum.inPerson
        ..origin = AppointmentOriginEnum.clinicService
        ..clinicId = '00000000-0000-4000-8000-000000000033'
        ..startAt = DateTime.parse('2026-06-22T11:00:00Z')
        ..feeDzd = 4000;
    });

    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SpecialistAppointmentRowTile(
            appointment: appointment,
            onTap: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Séance clinique'), findsOneWidget);
  });
}
