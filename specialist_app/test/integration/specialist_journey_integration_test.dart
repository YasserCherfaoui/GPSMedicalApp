import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/appointments/repositories/specialist_appointment_repository.dart';
import 'package:specialist_app/features/prescriptions/repositories/specialist_prescription_repository.dart';
import 'package:specialist_app/features/teleconsultation/repositories/specialist_teleconsultation_repository.dart';

/// Mock-layer integration: specialist happy-path API sequence (A-12.6).
void main() {
  group('specialist journey integration (mock layer)', () {
    late Dio dio;
    late DioAdapter adapter;
    late GpsMedicalClient client;
    late SpecialistAppointmentRepository appointments;
    late SpecialistPrescriptionRepository prescriptions;
    late SpecialistTeleconsultationRepository teleconsult;

    const appointmentId = '00000000-0000-4000-8000-000000000099';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
      adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      dio.httpClientAdapter = adapter;
      client = GpsMedicalClient(
        tokenStore: InMemoryTokenStore(),
        v1Dio: dio,
        apiRootUrl: 'http://localhost:8080',
      );
      client.applyBearerToken('specialist-token');
      appointments = SpecialistAppointmentRepository(client);
      prescriptions = SpecialistPrescriptionRepository(client);
      teleconsult = SpecialistTeleconsultationRepository(client);
    });

    test(
      'confirm → message thread → prescription → teleconsult session',
      () async {
        adapter.onGet('/appointments', (server) {
          server.reply(200, {
            'data': [
              {
                'id': appointmentId,
                'status': 'pending',
                'mode': 'telehealth',
                'start_at': '2026-06-20T09:00:00Z',
                'end_at': '2026-06-20T09:30:00Z',
              },
            ],
            'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
          });
        }, queryParameters: {'status': 'pending', 'page': '1', 'page_size': '20'});

        adapter.onPost('/appointments/$appointmentId/confirm', (server) {
          server.reply(200, {
            'id': appointmentId,
            'status': 'confirmed',
            'mode': 'telehealth',
          });
        });

        adapter.onGet('/messaging/threads', (server) {
          server.reply(200, {
            'data': [
              {
                'id': '00000000-0000-4000-8000-000000000010',
                'appointment_id': appointmentId,
              },
            ],
            'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
          });
        }, queryParameters: {'page': '1', 'page_size': '20'});

        adapter.onPost('/messaging/threads/00000000-0000-4000-8000-000000000010/messages', (
          server,
        ) {
          server.reply(201, {
            'id': '00000000-0000-4000-8000-000000000011',
            'thread_id': '00000000-0000-4000-8000-000000000010',
            'body': 'Bonjour, je confirme votre rendez-vous.',
            'sender_id': 'specialist-1',
          });
        });

        adapter.onPost('/prescriptions', (server) {
          server.reply(201, {
            'id': '00000000-0000-4000-8000-000000000020',
            'appointment_id': appointmentId,
            'status': 'issued',
          });
        });

        adapter.onPost('/teleconsultations/$appointmentId/session', (server) {
          server.reply(200, {
            'appointment_id': appointmentId,
            'room_id': 'room-99',
            'ice_servers': [
              {'urls': 'stun:stun.l.google.com:19302'},
            ],
          });
        });

        final pending = await appointments.list(status: 'pending', page: 1);
        expect(pending.appointments.single.id, appointmentId);

        final confirmed = await appointments.confirm(appointmentId);
        expect(confirmed.status, AppointmentStatusEnum.confirmed);

        final threads = await client.messaging.listMessagingThreads(
          page: 1,
          pageSize: 20,
        );
        final threadId = threads.data?.data?.single.id;
        expect(threadId, isNotNull);

        final message = await client.messaging.createMessagingThreadMessage(
          threadId: threadId!,
          messageCreate: MessageCreate((b) {
            b.body = 'Bonjour, je confirme votre rendez-vous.';
          }),
        );
        expect(message.data?.body, contains('confirme'));

        final prescription = await prescriptions.create(
          appointmentId: appointmentId,
          diagnosis: 'Rhume',
          items: [
            PrescriptionItem((i) {
              i
                ..drugName = 'Paracétamol'
                ..dosage = '500 mg'
                ..frequency = '3x/jour'
                ..durationDays = 5;
            }),
          ],
        );
        expect(prescription.id, isNotNull);

        final session = await teleconsult.startSession(appointmentId);
        expect(session.roomId, 'room-99');
      },
    );
  });
}
