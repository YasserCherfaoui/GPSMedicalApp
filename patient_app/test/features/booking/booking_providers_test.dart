import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/providers/appointment_detail.provider.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/providers/dependents_list.provider.dart';
import 'package:patient_app/features/booking/utils/booking_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;
  late ProviderContainer container;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    container = ProviderContainer(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('Dependents list', () {
    test('fetches dependents for booking step 2', () async {
      adapter.onGet('/patients/me/dependents', (server) {
        return server.reply(200, [
          {
            'id': 'dep-1',
            'full_name': 'Amina Benali',
            'relation': 'child',
            'birth_date': '2015-03-10',
            'gender': 'female',
          },
        ]);
      });

      final list = await container.read(dependentsListProvider.future);
      expect(list, hasLength(1));
      expect(list.first.id, 'dep-1');
      expect(list.first.fullName, 'Amina Benali');
    });
  });

  group('Booking draft submit', () {
    test('happy path POST includes slot_lock_token and dependent_id', () async {
      const doctorId = 'doc-1';
      const startAt = '2026-06-10T09:00:00Z';

      adapter.onPost('/appointments', (server) {
        return server.reply(201, {
          'id': 'appt-1',
          'patient_id': 'pat-1',
          'doctor_id': doctorId,
          'start_at': startAt,
          'end_at': '2026-06-10T09:30:00Z',
          'mode': 'in_person',
          'status': 'confirmed',
          'fee_dzd': 3000,
          'payment_status': 'unpaid',
          'created_at': startAt,
          'updated_at': startAt,
          'dependent_id': 'dep-1',
        });
      });

      adapter.onGet('/doctors/$doctorId', (server) {
        return server.reply(200, {
          'id': doctorId,
          'full_name': 'Karim Benali',
          'consultation_fee_dzd': 3000,
        });
      });

      final draft = container.read(bookingDraftProvider.notifier);
      draft.startBooking(
        doctorId: doctorId,
        doctor: $Doctor(
          (b) => b
            ..id = doctorId
            ..fullName = 'Karim Benali'
            ..consultationFeeDzd = 3000,
        ),
      );
      draft.selectSlot(
        AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.parse(startAt)
            ..endAt = DateTime.parse('2026-06-10T09:30:00Z')
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'lock-token-abc',
        ),
      );
      draft.setDependent('dep-1');

      final appointment = await draft.submitCreate();
      expect(appointment.id, 'appt-1');
    });

  });

  group('Appointment cancel', () {
    test('cancel POST refreshes appointment detail state', () async {
      const appointmentId = 'appt-1';
      const doctorId = 'doc-1';

      adapter.onGet('/appointments/$appointmentId', (server) {
        return server.reply(200, {
          'id': appointmentId,
          'patient_id': 'pat-1',
          'doctor_id': doctorId,
          'start_at': '2026-06-10T09:00:00Z',
          'end_at': '2026-06-10T09:30:00Z',
          'mode': 'in_person',
          'status': 'confirmed',
          'fee_dzd': 3000,
          'payment_status': 'unpaid',
          'created_at': '2026-06-10T09:00:00Z',
          'updated_at': '2026-06-10T09:00:00Z',
        });
      });

      adapter.onGet('/doctors/$doctorId', (server) {
        return server.reply(200, {
          'id': doctorId,
          'full_name': 'Karim Benali',
        });
      });

      adapter.onPost('/appointments/$appointmentId/cancel', (server) {
        return server.reply(200, {
          'id': appointmentId,
          'patient_id': 'pat-1',
          'doctor_id': doctorId,
          'start_at': '2026-06-10T09:00:00Z',
          'end_at': '2026-06-10T09:30:00Z',
          'mode': 'in_person',
          'status': 'cancelled',
          'fee_dzd': 3000,
          'payment_status': 'unpaid',
          'created_at': '2026-06-10T09:00:00Z',
          'updated_at': '2026-06-10T09:00:00Z',
        });
      });

      await container.read(appointmentDetailProvider(appointmentId).future);
      final updated = await container
          .read(appointmentDetailProvider(appointmentId).notifier)
          .cancel(reason: 'Change of plans');
      expect(updated.status, AppointmentStatusEnum.cancelled);
    });
  });
}
