import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/stats/repositories/specialist_analytics_repository.dart';

void main() {
  group('SpecialistAnalyticsRepository', () {
    late Dio dio;
    late DioAdapter adapter;
    late SpecialistAnalyticsRepository repository;

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
      repository = SpecialistAnalyticsRepository(client);
    });

    test('fetchOverview parses doctor overview', () async {
      adapter.onGet('/analytics/doctor/overview', (server) {
        server.reply(200, {
          'appointments_total': 12,
          'appointments_completed': 10,
          'revenue_dzd': 45000,
          'no_show_rate': 0.08,
        });
      });

      final overview = await repository.fetchOverview();
      expect(overview.appointmentsTotal, 12);
      expect(overview.noShowRate, closeTo(0.08, 0.001));
    });

    test('fetchTimeseries parses metric points', () async {
      adapter.onGet('/analytics/doctor/timeseries', (server) {
        server.reply(200, {
          'metric': 'appointments',
          'granularity': 'week',
          'points': [
            {'date': '2026-06-01', 'value': 3},
            {'date': '2026-06-08', 'value': 5},
          ],
        });
      });

      final series = await repository.fetchTimeseries(
        metric: 'appointments',
        granularity: 'week',
        from: Date(2026, 5, 1),
        to: Date(2026, 6, 16),
      );
      expect(series.points?.length, 2);
    });
  });
}
