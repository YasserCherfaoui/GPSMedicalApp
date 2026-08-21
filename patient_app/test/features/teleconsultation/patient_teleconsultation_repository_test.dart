import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/teleconsultation/repositories/patient_teleconsultation_repository.dart';

void main() {
  group('PatientTeleconsultationRepository', () {
    late Dio dio;
    late DioAdapter adapter;
    late PatientTeleconsultationRepository repository;

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
      repository = PatientTeleconsultationRepository(client);
    });

    test('startSession returns TeleSession on 200', () async {
      adapter.onPost('/teleconsultations/appt-1/session', (server) {
        server.reply(200, {
          'appointment_id': 'appt-1',
          'room_id': 'room-1',
          'ice_servers': [
            {'urls': 'stun:stun.l.google.com:19302'},
          ],
        });
      });

      final session = await repository.startSession('appt-1');
      expect(session.roomId, 'room-1');
    });

    test('startSession maps 425 to TeleconsultationSessionException', () async {
      adapter.onPost('/teleconsultations/appt-1/session', (server) {
        server.reply(425, {
          'title': 'Too Early',
          'detail': 'La session n\'est pas encore ouverte',
        });
      });

      expect(
        () => repository.startSession('appt-1'),
        throwsA(
          isA<TeleconsultationSessionException>().having(
            (e) => e.statusCode,
            'statusCode',
            425,
          ),
        ),
      );
    });

    test('endSession posts duration and quality', () async {
      adapter.onPost(
        '/teleconsultations/appt-1/end',
        (server) {
          server.reply(200, {
            'appointment_id': 'appt-1',
            'room_id': 'room-1',
            'duration_seconds': 120,
          });
        },
        data: {'duration_seconds': 120, 'quality_score': 4},
      );

      final session = await repository.endSession(
        appointmentId: 'appt-1',
        durationSeconds: 120,
        qualityScore: 4,
      );
      expect(session.durationSeconds, 120);
    });

    test('buildIceServers merges session and TURN credentials', () {
      final session =
          standardSerializers.deserializeWith(TeleSession.serializer, {
                'appointment_id': 'appt-1',
                'room_id': 'room-1',
                'ice_servers': [
                  {'urls': 'stun:stun.test'},
                ],
              })
              as TeleSession;
      final turn = TurnCredentials((b) {
        b
          ..urls = ListBuilder<String>(['turn:turn.test'])
          ..username = 'user'
          ..credential = 'pass';
      });

      final servers = buildIceServers(session: session, turnCredentials: turn);
      expect(servers.length, 2);
      expect(servers.last['username'], 'user');
    });
  });
}
