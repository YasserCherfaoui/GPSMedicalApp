import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:specialist_app/features/messaging/screens/specialist_messaging_threads_screen.dart';
import 'package:specialist_app/routing/specialist_routes.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockEmptyMessagingThreads();
  });

  testWidgets('messaging threads shows empty state', (tester) async {
    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistMessagingThreadsScreen(),
        extraRoutes: [
          GoRoute(
            path: '/specialist/messages/:id',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: SpecialistRoutes.shell,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aucune conversation pour le moment'), findsOneWidget);
  });

  testWidgets('messaging threads shows thread rows', (tester) async {
    harness.adapter.onGet('/messaging/threads', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': '00000000-0000-4000-8000-000000000010',
            'patient_id': '00000000-0000-4000-8000-000000000050',
            'unread_count': 1,
            'last_message_at': '2026-06-20T09:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    await tester.pumpWidget(
      harness.wrapWithRouter(
        const SpecialistMessagingThreadsScreen(),
        extraRoutes: [
          GoRoute(
            path: '/specialist/messages/:id',
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Patient ····0050'), findsOneWidget);
  });
}
