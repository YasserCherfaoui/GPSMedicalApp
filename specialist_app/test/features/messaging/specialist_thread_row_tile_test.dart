import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/messaging/widgets/specialist_thread_row_tile.dart';
import 'package:specialist_app/features/schedule/widgets/schedule_availability_preview.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  testWidgets('thread row tile shows patient ref and preview', (tester) async {
    var tapped = false;
    final thread = Thread(
      (b) => b
        ..id = '00000000-0000-4000-8000-000000000010'
        ..patientId = '00000000-0000-4000-8000-000000000050'
        ..unreadCount = 2
        ..lastMessageAt = DateTime.parse('2026-06-20T09:00:00Z'),
    );
    final item = MessagingThreadItem(
      thread: thread,
      lastMessagePreview: 'Bonjour docteur',
    );

    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SpecialistThreadRowTile(
            item: item,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Patient ····0050'), findsOneWidget);
    expect(find.text('Bonjour docteur'), findsOneWidget);
    await tester.tap(find.byType(SpecialistThreadRowTile));
    expect(tapped, isTrue);
  });

  testWidgets('schedule availability preview shows empty state', (tester) async {
    harness.setLargeSurface(tester);
    harness.mockDoctorMe();
    harness.adapter.onGet(
      '/doctors/00000000-0000-4000-8000-000000000010/availability',
      (server) => server.reply(200, <Map<String, dynamic>>[]),
    );

    await tester.pumpWidget(
      harness.wrapScreen(const Scaffold(body: ScheduleAvailabilityPreview())),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aucun créneau'), findsOneWidget);
  });
}
