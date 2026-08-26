import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:specialist_app/features/schedule/screens/schedule_editor_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  late int weekday;
  const templateId = '00000000-0000-4000-8000-000000000200';

  Map<String, dynamic> templateJson() => {
        'id': templateId,
        'weekday': weekday,
        'start_time': '09:00',
        'end_time': '12:00',
        'slot_duration_minutes': 30,
        'mode': 'both',
        'active': true,
      };

  setUp(() {
    SharedPreferences.setMockInitialValues({
      'gps.specialist.donated_schedule_notice_seen': true,
    });
    harness = SpecialistTestHarness()..setUpClient();
    weekday = DateTime.now().weekday % 7;
    harness.adapter.onGet('/doctors/me/schedule/templates', (server) {
      return server.reply(200, [templateJson()]);
    });
    harness.adapter.onGet('/doctors/me/schedule/exceptions', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
    harness.mockEmptyAppointments();
    harness.mockDoctorMe();
    harness.adapter.onGet('/doctors/me/memberships', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
    harness.adapter.onGet(
      '/doctors/00000000-0000-4000-8000-000000000010/availability',
      (server) => server.reply(200, <Map<String, dynamic>>[]),
    );
  });

  testWidgets('schedule editor shows templates exceptions and preview', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(const ScheduleEditorScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mon agenda'), findsOneWidget);
    expect(find.text('Horaires'), findsOneWidget);
    expect(find.textContaining('09:00'), findsWidgets);
    expect(find.textContaining('Personnel (mon cabinet)'), findsOneWidget);

    await tester.tap(find.text('Ajouter une plage'));
    await tester.pumpAndSettle();
    expect(find.text('Mode de consultation'), findsOneWidget);
    expect(find.text('Affectation'), findsOneWidget);

    harness.adapter.onPost('/doctors/me/schedule/templates', (server) {
      return server.reply(201, {
        ...templateJson(),
        'id': '00000000-0000-4000-8000-000000000201',
        'end_time': '17:00',
      });
    });
    await tester.tap(find.text('Enregistrer la plage'));
    await tester.pumpAndSettle();
    expect(find.text('Agenda enregistré.'), findsOneWidget);

    await tester.tap(find.text('Horaires'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert).first);
    await tester.pumpAndSettle();
    expect(find.text('Modifier'), findsOneWidget);
    await tester.tap(find.text('Supprimer'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Supprimer'), findsWidgets);
    await tester.tap(find.text('Annuler').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Exceptions'));
    await tester.pumpAndSettle();
    expect(find.text('Aucune exception'), findsOneWidget);

    await tester.tap(find.text('Aperçu'));
    await tester.pumpAndSettle();
    expect(find.text('Aucun créneau'), findsOneWidget);
  });

  testWidgets('schedule editor filters donated templates by clinic', (
    tester,
  ) async {
    const clinicId = 'clinic-filter-1';
    harness.adapter.onGet('/doctors/me/memberships', (server) {
      return server.reply(200, [
        {
          'id': 'mem-1',
          'clinic_id': clinicId,
          'specialist_id': '00000000-0000-4000-8000-000000000010',
          'clinic_name': 'Clinique Hydra',
          'status': 'active',
          'visible_on_profile': true,
        },
      ]);
    });
    harness.adapter.onGet('/doctors/me/schedule/templates', (server) {
      return server.reply(200, [
        {
          ...templateJson(),
          'id': '00000000-0000-4000-8000-000000000210',
          'clinic_id': clinicId,
        },
        {
          ...templateJson(),
          'id': '00000000-0000-4000-8000-000000000211',
          'start_time': '14:00',
          'end_time': '16:00',
        },
      ]);
    });

    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(
        const ScheduleEditorScreen(filterClinicId: clinicId),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Affichage des créneaux donnés à Clinique Hydra'),
      findsOneWidget,
    );
    expect(find.textContaining('09:00'), findsWidgets);
    expect(find.textContaining('14:00'), findsNothing);
    expect(find.textContaining('Donné à Clinique Hydra'), findsOneWidget);
  });

  testWidgets('schedule editor lists exception cards', (tester) async {
    final now = DateTime.now();
    harness.adapter.onGet('/doctors/me/schedule/exceptions', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000220',
          'kind': 'vacation',
          'start_at': DateTime(now.year, now.month, 5).toUtc().toIso8601String(),
          'end_at': DateTime(now.year, now.month, 7).toUtc().toIso8601String(),
          'note': 'Congés',
        },
      ]);
    });

    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(const ScheduleEditorScreen()),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Exceptions'));
    await tester.pumpAndSettle();
    expect(find.text('Congés'), findsOneWidget);
  });
}
