import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/messaging/screens/specialist_messaging_thread_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const threadId = '00000000-0000-4000-8000-000000000010';
  const userId = '00000000-0000-4000-8000-000000000010';
  const patientUserId = '00000000-0000-4000-8000-000000000050';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.adapter.onGet('/auth/me', (server) {
      return server.reply(200, {
        'id': userId,
        'phone': '+213551000001',
        'role': 'specialist',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
      });
    });
    harness.adapter.onGet('/messaging/threads/$threadId', (server) {
      return server.reply(200, {
        'id': threadId,
        'patient_id': patientUserId,
        'unread_count': 1,
      });
    });
    harness.adapter.onGet('/messaging/threads/$threadId/messages', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000011',
          'thread_id': threadId,
          'sender_id': patientUserId,
          'body': 'Bonjour docteur',
          'attachments': <Map<String, dynamic>>[],
          'created_at': '2026-06-01T09:00:00Z',
          'read_at': null,
        },
      ]);
    });
    harness.adapter.onPost(
      '/messaging/messages/00000000-0000-4000-8000-000000000011/read',
      (server) => server.reply(204, null),
    );
    harness.adapter.onPost('/messaging/threads/$threadId/messages', (server) {
      return server.reply(201, {
        'id': '00000000-0000-4000-8000-000000000012',
        'thread_id': threadId,
        'sender_id': userId,
        'body': 'Bonjour, je confirme.',
        'attachments': <Map<String, dynamic>>[],
        'created_at': '2026-06-01T09:05:00Z',
        'read_at': null,
      });
    });
  });

  testWidgets('messaging thread loads bubbles and sends a message', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistMessagingThreadScreen(threadId: threadId),
        extraRoutes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text('Bonjour docteur'), findsOneWidget);
    expect(find.text('Écrire un message…'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Bonjour, je confirme.');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle();

    expect(find.text('Bonjour, je confirme.'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 35));
  });
}
