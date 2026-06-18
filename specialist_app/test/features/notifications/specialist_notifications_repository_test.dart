import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/notifications/repositories/specialist_notifications_repository.dart';

void main() {
  group('SpecialistNotificationsRepository', () {
    late Dio dio;
    late DioAdapter adapter;
    late SpecialistNotificationsRepository repository;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
      adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      dio.httpClientAdapter = adapter;
      final client = GpsMedicalClient(
        tokenStore: InMemoryTokenStore(),
        v1Dio: dio,
        apiRootUrl: 'http://localhost:8080',
      );
      client.applyBearerToken('test-token');
      repository = SpecialistNotificationsRepository(client);
    });

    test('list parses paginated notifications', () async {
      adapter.onGet('/notifications', (server) {
        server.reply(200, {
          'data': [
            {
              'id': '00000000-0000-4000-8000-000000000001',
              'type': 'new_message',
              'title': 'Nouveau message',
              'body': 'Bonjour',
            },
          ],
          'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
        });
      }, queryParameters: {'page': '1', 'page_size': '20'});

      final result = await repository.list(page: 1);
      expect(result.items.single.title, 'Nouveau message');
      expect(result.hasMore, isFalse);
    });

    test('markAllRead posts to read-all endpoint', () async {
      adapter.onPost('/notifications/read-all', (server) {
        server.reply(204, null);
      });

      await repository.markAllRead();
    });
  });
}
