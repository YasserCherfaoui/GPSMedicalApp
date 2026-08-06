import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    await tester.tap(find.text('Ajouter une plage'));
    await tester.pumpAndSettle();
    expect(find.text('Mode de consultation'), findsOneWidget);

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
