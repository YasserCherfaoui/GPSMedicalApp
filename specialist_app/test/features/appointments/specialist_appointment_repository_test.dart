import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/appointments/repositories/specialist_appointment_repository.dart';
import 'package:specialist_app/features/appointments/utils/appointment_api_error.dart';
import 'package:specialist_app/features/appointments/utils/appointment_display.dart';
import 'package:specialist_app/features/appointments/utils/appointment_enums.dart';

void main() {
  group('SpecialistAppointmentRepository', () {
    late Dio dio;
    late DioAdapter adapter;
    late SpecialistAppointmentRepository repository;

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
      repository = SpecialistAppointmentRepository(client);
    });

    test('list parses paginated appointments', () async {
      adapter.onGet('/appointments', (server) {
        server.reply(200, {
          'data': [
            {
              'id': '00000000-0000-4000-8000-000000000001',
              'status': 'pending',
              'mode': 'in_person',
              'start_at': '2026-06-20T09:00:00Z',
            },
          ],
          'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
        });
      }, queryParameters: {'status': 'pending', 'page': '1', 'page_size': '20'});

      final result = await repository.list(status: 'pending', page: 1);

      expect(result.total, 1);
      expect(result.appointments.single.status, AppointmentStatusEnum.pending);
      expect(result.hasMore, isFalse);
    });

    test('confirm posts to confirm endpoint', () async {
      adapter.onPost(
        '/appointments/00000000-0000-4000-8000-000000000001/confirm',
        (server) {
          server.reply(200, {
            'id': '00000000-0000-4000-8000-000000000001',
            'status': 'confirmed',
          });
        },
      );

      final appointment = await repository.confirm(
        '00000000-0000-4000-8000-000000000001',
      );

      expect(appointment.status, AppointmentStatusEnum.confirmed);
    });

    test('cancel maps 422 to AppointmentActionException', () async {
      adapter.onPost(
        '/appointments/00000000-0000-4000-8000-000000000001/cancel',
        (server) {
          server.reply(422, {
            'title': 'Invalid',
            'detail': 'Cannot cancel completed appointment',
          });
        },
      );

      expect(
        () => repository.cancel(
          appointmentId: '00000000-0000-4000-8000-000000000001',
        ),
        throwsA(
          isA<AppointmentActionException>().having(
            (e) => e.message,
            'message',
            'Cannot cancel completed appointment',
          ),
        ),
      );
    });
  });

  group('appointment_display', () {
    test('pending appointments use anonymous patient label', () {
      final l10n = lookupAppLocalizations(const Locale('fr'));
      final appointment = Appointment((b) {
        b
          ..status = AppointmentStatusEnum.pending
          ..patientId = '00000000-0000-4000-8000-000000000099';
      });

      expect(
        specialistPatientDisplayLabel(l10n, appointment),
        l10n.specialistAppointmentPatientAnonymous,
      );
    });

    test('confirmed appointments show patient ref suffix', () {
      final l10n = lookupAppLocalizations(const Locale('fr'));
      final appointment = Appointment((b) {
        b
          ..status = AppointmentStatusEnum.confirmed
          ..patientId = '00000000-0000-4000-8000-000000000099';
      });

      expect(
        specialistPatientDisplayLabel(l10n, appointment),
        l10n.specialistAppointmentPatientRef('0099'),
      );
    });

    test('canMarkNoShow requires confirmed status after end_at', () {
      final beforeEnd = Appointment((b) {
        b
          ..status = AppointmentStatusEnum.confirmed
          ..endAt = DateTime.now().toUtc().add(const Duration(hours: 1));
      });
      expect(canMarkNoShow(beforeEnd), isFalse);

      final afterEnd = Appointment((b) {
        b
          ..status = AppointmentStatusEnum.confirmed
          ..endAt = DateTime.now().toUtc().subtract(const Duration(minutes: 1));
      });
      expect(canMarkNoShow(afterEnd), isTrue);
    });
  });
}
