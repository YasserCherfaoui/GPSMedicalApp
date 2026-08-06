import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/appointments/repositories/specialist_appointment_repository.dart';
import 'package:specialist_app/features/credentials/repositories/credentials_repository.dart';
import 'package:specialist_app/features/schedule/repositories/schedule_repository.dart';
import 'package:specialist_app/features/verification/specialist_verification_repository.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';

import '../support/specialist_test_harness.dart';

/// Mock-layer onboarding journey: profile → credentials → reject → resubmit →
/// schedule templates → inbox pending (A-12.6).
void main() {
  group('specialist onboarding journey (mock layer)', () {
    late Dio dio;
    late DioAdapter adapter;
    late GpsMedicalClient client;
    late SpecialistVerificationRepository verification;
    late CredentialsRepository credentials;
    late ScheduleRepository schedule;
    late SpecialistAppointmentRepository appointments;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: kSpecialistTestApiV1));
      adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      dio.httpClientAdapter = adapter;
      client = GpsMedicalClient(
        tokenStore: InMemoryTokenStore(),
        v1Dio: dio,
        apiRootUrl: kSpecialistTestApiRoot,
      );
      client.applyBearerToken('specialist-token');
      verification = SpecialistVerificationRepository(client);
      credentials = CredentialsRepository(client);
      schedule = ScheduleRepository(client);
      appointments = SpecialistAppointmentRepository(client);

      final pendingEmpty = minimalDoctorProfile(
        verificationStatus: 'pending',
        credentials: const [],
      );
      final rejected = {
        ...minimalDoctorProfile(
          verificationStatus: 'rejected',
          credentials: [
            {
              'id': '00000000-0000-4000-8000-000000000099',
              'type': 'diploma',
              'status': 'rejected',
            },
          ],
        ),
        'verification_comment': 'Scan flou',
      };
      final resubmitted = minimalDoctorProfile(
        verificationStatus: 'pending',
        credentials: [
          {
            'id': '00000000-0000-4000-8000-000000000100',
            'type': 'diploma',
            'status': 'pending',
          },
        ],
      );

      var doctorsMeCall = 0;
      adapter.onGet('/doctors/me', (server) {
        server.replyCallback(200, (_) {
          doctorsMeCall++;
          if (doctorsMeCall <= 2) return pendingEmpty;
          if (doctorsMeCall == 3) return rejected;
          return resubmitted;
        });
      });

      adapter.onPost('/doctors/me/credentials', (server) {
        return server.reply(201, {
          'id': '00000000-0000-4000-8000-000000000099',
          'type': 'diploma',
          'status': 'pending',
        });
      });

      adapter.onGet('/doctors/me/schedule/templates', (server) {
        return server.reply(200, [
          {
            'id': '00000000-0000-4000-8000-000000000200',
            'weekday': 1,
            'start_time': '09:00',
            'end_time': '12:00',
            'slot_duration_minutes': 30,
            'mode': 'both',
            'active': true,
          },
        ]);
      });

      adapter.onGet(
        '/appointments',
        (server) {
          return server.reply(200, {
            'data': [minimalAppointmentJson(status: 'pending')],
            'meta': {
              'page': 1,
              'page_size': 20,
              'total': 1,
              'total_pages': 1,
            },
          });
        },
        queryParameters: {
          'status': 'pending',
          'page': '1',
          'page_size': '20',
        },
      );
    });

    test(
      'profile → credentials → rejected → resubmit → schedule → inbox',
      () async {
        final initial = await verification.fetch();
        expect(initial.status, SpecialistVerificationStatus.pending);
        expect(initial.hasSubmittedCredentials, isFalse);

        final profile = await credentials.fetchDoctorProfile();
        expect(profile.fullName, 'Test Specialist');

        final rejectedState = await verification.fetch();
        expect(rejectedState.status, SpecialistVerificationStatus.rejected);
        expect(rejectedState.comment, 'Scan flou');

        final afterResubmit = await verification.fetch();
        expect(afterResubmit.status, SpecialistVerificationStatus.pending);
        expect(afterResubmit.hasSubmittedCredentials, isTrue);

        final templates = await schedule.listTemplates();
        expect(templates, isNotEmpty);
        expect(templates.first.startTime, '09:00');

        final pending = await appointments.list(status: 'pending', page: 1);
        expect(pending.appointments, hasLength(1));
        expect(
          pending.appointments.single.status,
          AppointmentStatusEnum.pending,
        );
      },
    );
  });
}
