import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/notifications/screens/specialist_notifications_list_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockEmptyNotifications();
  });

  testWidgets('notifications list shows empty state', (tester) async {
    await tester.pumpWidget(
      harness.wrapScreen(const SpecialistNotificationsListScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Aucune notification'), findsOneWidget);
  });

  testWidgets('notifications list shows item row', (tester) async {
    harness.adapter.onGet('/notifications', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': '00000000-0000-4000-8000-000000000001',
            'type': 'new_message',
            'title': 'Nouveau message',
            'body': 'Bonjour',
            'created_at': '2026-06-20T09:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    await tester.pumpWidget(
      harness.wrapScreen(const SpecialistNotificationsListScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nouveau message'), findsOneWidget);
    expect(find.text('Bonjour'), findsOneWidget);
  });
}
