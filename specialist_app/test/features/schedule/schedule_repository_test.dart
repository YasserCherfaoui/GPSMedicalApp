import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/schedule/repositories/schedule_repository.dart';
import 'package:specialist_app/features/schedule/utils/schedule_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ScheduleRepository repository;

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
    repository = ScheduleRepository(client);
  });

  test('createTemplate posts schedule body', () async {
    adapter.onPost('/doctors/me/schedule/templates', (server) {
      server.reply(201, {
        'id': '00000000-0000-4000-8000-000000000099',
        'weekday': 1,
        'start_time': '09:00',
        'end_time': '12:00',
        'slot_duration_minutes': 30,
        'mode': 'both',
        'active': true,
      });
    }, data: {
      'weekday': 1,
      'start_time': '09:00',
      'end_time': '12:00',
      'slot_duration_minutes': 30,
      'mode': 'both',
    });

    final created = await repository.createTemplate(
      weekday: 1,
      startTime: '09:00',
      endTime: '12:00',
      slotDurationMinutes: 30,
      mode: 'both',
    );

    expect(created.weekday, 1);
    expect(created.startTime, '09:00');
  });

  test('createTemplate posts clinic_id when location is a clinic', () async {
    const clinicId = '00000000-0000-4000-8000-000000000077';
    adapter.onPost('/doctors/me/schedule/templates', (server) {
      server.reply(201, {
        'id': '00000000-0000-4000-8000-000000000099',
        'clinic_id': clinicId,
        'weekday': 2,
        'start_time': '10:00',
        'end_time': '14:00',
        'slot_duration_minutes': 30,
        'mode': 'in_person',
        'active': true,
      });
    }, data: {
      'weekday': 2,
      'clinic_id': clinicId,
      'start_time': '10:00',
      'end_time': '14:00',
      'slot_duration_minutes': 30,
      'mode': 'in_person',
    });

    final created = await repository.createTemplate(
      weekday: 2,
      startTime: '10:00',
      endTime: '14:00',
      slotDurationMinutes: 30,
      mode: 'in_person',
      clinicId: clinicId,
    );

    expect(created.clinicId, clinicId);
  });

  test('createTemplate maps 409 SPECIALIST_SCHEDULE_CONFLICT', () async {
    adapter.onPost('/doctors/me/schedule/templates', (server) {
      server.reply(409, {
        'title': 'Conflict',
        'detail': 'Overlap',
        'code': 'SPECIALIST_SCHEDULE_CONFLICT',
      });
    });

    expect(
      () => repository.createTemplate(
        weekday: 1,
        startTime: '09:00',
        endTime: '12:00',
        slotDurationMinutes: 30,
        mode: 'both',
      ),
      throwsA(
        isA<ScheduleConflictException>().having(
          (e) => e.code,
          'code',
          'SPECIALIST_SCHEDULE_CONFLICT',
        ),
      ),
    );
  });

  test('createTemplate maps 422 to ScheduleValidationException', () async {
    adapter.onPost('/doctors/me/schedule/templates', (server) {
      server.reply(422, {
        'title': 'Champs invalides',
        'status': 422,
        'errors': [
          {
            'field': 'end_time',
            'message': 'Invalid',
            'code': 'END_TIME_MUST_EXCEED_START',
          },
        ],
      });
    });

    expect(
      () => repository.createTemplate(
        weekday: 1,
        startTime: '12:00',
        endTime: '09:00',
        slotDurationMinutes: 30,
        mode: 'both',
      ),
      throwsA(
        isA<ScheduleValidationException>().having(
          (e) => e.fieldErrors['end_time'],
          'end_time',
          'END_TIME_MUST_EXCEED_START',
        ),
      ),
    );
  });
}
