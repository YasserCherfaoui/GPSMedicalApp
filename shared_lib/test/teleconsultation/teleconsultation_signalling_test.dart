import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/src/teleconsultation/teleconsultation_signalling.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('TeleconsultationSignallingClient', () {
    late Dio dio;
    late DioAdapter adapter;
    late TeleconsultationSignallingClient client;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
      adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      dio.httpClientAdapter = adapter;
      client = TeleconsultationSignallingClient(dio);
    });

    test('post offer returns created signal', () async {
      adapter.onPost('/teleconsultations/appt-1/signals', (server) {
        server.reply(201, {
          'seq': 1,
          'type': 'offer',
          'sdp': 'v=0',
          'created_at': '2026-08-21T00:00:00Z',
        });
      }, data: {'type': 'offer', 'sdp': 'v=0'});

      final signal = await client.post(
        appointmentId: 'appt-1',
        type: 'offer',
        sdp: 'v=0',
      );
      expect(signal.seq, 1);
      expect(signal.type, 'offer');
      expect(signal.sdp, 'v=0');
    });

    test('list returns peer signals since cursor', () async {
      adapter.onGet('/teleconsultations/appt-1/signals', (server) {
        server.reply(200, {
          'signals': [
            {
              'seq': 3,
              'type': 'ice_candidate',
              'candidate': {
                'candidate': 'candidate:1',
                'sdp_mid': '0',
                'sdp_mline_index': 0,
              },
              'created_at': '2026-08-21T00:00:00Z',
            },
          ],
        });
      }, queryParameters: {'since': '2'});

      final signals = await client.list(appointmentId: 'appt-1', since: 2);
      expect(signals, hasLength(1));
      expect(signals.first.type, 'ice_candidate');
      expect(signals.first.candidate?.candidate, 'candidate:1');
      expect(signals.first.candidate?.sdpMLineIndex, 0);
    });
  });
}
