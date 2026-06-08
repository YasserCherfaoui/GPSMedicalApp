import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/notifications/repositories/notifications_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late NotificationsRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = NotificationsRepository(client);
  });

  test('countUnread reads meta.total with unread_only', () async {
    adapter.onGet('/notifications', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'notif-1',
            'type': 'new_message',
            'title': 'Nouveau message',
            'body': 'Bonjour',
            'data': {'thread_id': 'thread-1'},
            'created_at': '2026-06-01T10:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 1, 'total': 4, 'total_pages': 4},
      });
    });

    final count = await repo.countUnread();
    expect(count, 4);
  });

  test('markAllRead posts read-all', () async {
    adapter.onPost('/notifications/read-all', (server) {
      return server.reply(204, null);
    });

    await expectLater(repo.markAllRead(), completes);
  });
}
