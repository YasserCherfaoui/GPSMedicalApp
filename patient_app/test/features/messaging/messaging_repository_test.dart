import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/messaging/repositories/messaging_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MessagingRepository repo;

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
    repo = MessagingRepository(client);
  });

  test('listThreads returns paginated threads with previews', () async {
    adapter.onGet('/messaging/threads', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'thread-1',
            'patient_id': 'pat-1',
            'doctor_id': 'doc-1',
            'last_message_at': '2026-06-01T10:00:00Z',
            'unread_count': 2,
            'appointment_id': 'appt-1',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    adapter.onGet('/messaging/threads/thread-1/messages', (server) {
      return server.reply(200, [
        {
          'id': 'msg-1',
          'thread_id': 'thread-1',
          'sender_id': 'doc-user-1',
          'body': 'Bonjour, comment allez-vous ?',
          'attachments': [],
          'created_at': '2026-06-01T10:00:00Z',
          'read_at': null,
        },
      ]);
    });

    final result = await repo.listThreads(page: 1);
    expect(result.threads, hasLength(1));
    expect(result.threads.first.thread.id, 'thread-1');
    expect(result.threads.first.thread.unreadCount, 2);
    expect(
      result.threads.first.lastMessagePreview,
      'Bonjour, comment allez-vous ?',
    );
    expect(result.hasMore, isFalse);
  });
}
