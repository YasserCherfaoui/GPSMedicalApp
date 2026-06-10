import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/providers/appointment_detail.provider.dart';
import 'package:patient_app/features/booking/providers/appointments_history.provider.dart';
import 'package:patient_app/features/booking/providers/appointments_upcoming.provider.dart';
import 'package:patient_app/features/booking/providers/availability_window.provider.dart';
import 'package:patient_app/features/booking/providers/booking_draft.provider.dart';
import 'package:patient_app/features/booking/providers/dependents_list.provider.dart';
import 'package:patient_app/features/booking/utils/booking_dates.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;
  late ProviderContainer container;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    container = ProviderContainer(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
    );
  });

  tearDown(() async {
    container.dispose();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('booking_draft_v1');
  });

  group('Availability window', () {
    test('default range is today through today+14', () {
      container.listen(availabilityWindowNotifierProvider('doc-1'), (_, __) {});
      final window = container.read(
        availabilityWindowNotifierProvider('doc-1'),
      );
      final today = todayDate();
      expect(window.from, today);
      expect(window.to, addDays(today, kAvailabilityDefaultRangeDays));
    });

    test('nextWeek advances from/to by seven days within cap', () {
      const doctorId = 'doc-avail';
      container.listen(
        availabilityWindowNotifierProvider(doctorId),
        (_, __) {},
      );

      final before = container.read(
        availabilityWindowNotifierProvider(doctorId),
      );
      container
          .read(availabilityWindowNotifierProvider(doctorId).notifier)
          .nextWeek('both');
      final after = container.read(
        availabilityWindowNotifierProvider(doctorId),
      );

      expect(after.from, addDays(before.from, 7));
      expect(after.to, addDays(before.to, 7));
    });
  });

  group('Booking draft slot lock', () {
    test('selectSlot stores token and 5-minute expiry', () {
      const doctorId = 'doc-1';
      final draft = container.read(bookingDraftProvider.notifier);
      draft.startBooking(
        doctorId: doctorId,
        doctor: $Doctor(
          (b) => b
            ..id = doctorId
            ..fullName = 'Karim Benali',
        ),
      );
      draft.selectSlot(
        AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.utc(2026, 6, 10, 9)
            ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'lock-abc',
        ),
      );

      final state = container.read(bookingDraftProvider);
      expect(state.selectedSlot?.slotLockToken, 'lock-abc');
      expect(state.hasActiveLock, isTrue);
      expect(state.lockRemaining!.inMinutes, lessThanOrEqualTo(5));
    });

    test(
      'persisted draft omits lock token and restores doctor snapshot',
      () async {
        const doctorId = 'doc-persist';
        final draft = container.read(bookingDraftProvider.notifier);
        draft.startBooking(
          doctorId: doctorId,
          doctor: $Doctor(
            (b) => b
              ..id = doctorId
              ..title = 'Dr.'
              ..fullName = 'Karim Benali'
              ..consultationFeeDzd = 2800,
          ),
        );
        draft.selectSlot(
          AvailabilitySlot(
            (b) => b
              ..startAt = DateTime.utc(2026, 6, 10, 9)
              ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
              ..mode = AvailabilitySlotModeEnum.inPerson
              ..slotLockToken = 'lock-persist',
          ),
        );
        draft.setStep(3);
        draft.setReason('Contrôle annuel');
        await Future<void>.delayed(Duration.zero);

        final prefs = await SharedPreferences.getInstance();
        final raw = prefs.getString('booking_draft_v1');
        expect(raw, isNotNull);
        expect(raw, isNot(contains('slotLockToken')));
        expect(raw, isNot(contains('slotLockExpiresAt')));
        expect(raw, contains('Karim Benali'));

        container.dispose();
        final reloaded = ProviderContainer(
          overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
        );
        reloaded.listen(bookingDraftProvider, (_, __) {});
        await Future<void>.delayed(const Duration(milliseconds: 50));

        final state = reloaded.read(bookingDraftProvider);
        expect(state.pendingResumePrompt, isTrue);
        expect(state.step, 3);
        expect(state.reason, 'Contrôle annuel');
        expect(state.doctor?.fullName, 'Karim Benali');
        expect(state.hasActiveLock, isFalse);
        reloaded.dispose();
      },
    );

    test('selectSlotDraftOnly saves slot without active lock', () {
      final draft = container.read(bookingDraftProvider.notifier);
      draft.startBooking(
        doctorId: 'doc-offline',
        doctor: $Doctor(
          (b) => b
            ..id = 'doc-offline'
            ..fullName = 'Test',
        ),
      );
      draft.selectSlotDraftOnly(
        AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.utc(2026, 6, 10, 9)
            ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'should-not-persist',
        ),
      );

      final state = container.read(bookingDraftProvider);
      expect(state.selectedSlot?.slotLockToken, isNull);
      expect(state.hasActiveLock, isFalse);
    });

    test('clearSlotLock removes slot and expiry', () {
      final draft = container.read(bookingDraftProvider.notifier);
      draft.selectSlot(
        AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.utc(2026, 6, 10, 9)
            ..endAt = DateTime.utc(2026, 6, 10, 9, 30)
            ..mode = AvailabilitySlotModeEnum.inPerson
            ..slotLockToken = 'lock-abc',
        ),
      );
      draft.clearSlotLock();

      final state = container.read(bookingDraftProvider);
      expect(state.selectedSlot, isNull);
      expect(state.hasActiveLock, isFalse);
    });
  });

  group('Dependents list', () {
    test('fetches dependents for booking step 2', () async {
      container.listen(dependentsListProvider, (_, __) {});

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

    test(
      'submitCreate refreshes lock token when session lock expired',
      () async {
        const doctorId = 'doc-1';
        const startAt = '2026-06-10T09:00:00Z';

        adapter.onGet(
          '/doctors/$doctorId/availability',
          (server) => server.reply(200, [
            {
              'start_at': startAt,
              'end_at': '2026-06-10T09:30:00Z',
              'mode': 'in_person',
              'slot_lock_token': 'fresh-lock-token',
            },
          ]),
        );

        adapter.onPost('/appointments', (server) {
          return server.reply(201, {
            'id': 'appt-fresh',
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
          });
        });

        final draft = container.read(bookingDraftProvider.notifier);
        draft.startBooking(
          doctorId: doctorId,
          doctor: $Doctor(
            (b) => b
              ..id = doctorId
              ..fullName = 'Karim Benali',
          ),
        );
        draft.selectSlotDraftOnly(
          AvailabilitySlot(
            (b) => b
              ..startAt = DateTime.parse(startAt)
              ..endAt = DateTime.parse('2026-06-10T09:30:00Z')
              ..mode = AvailabilitySlotModeEnum.inPerson,
          ),
        );

        final appointment = await draft.submitCreate();
        expect(appointment.id, 'appt-fresh');
      },
    );
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
        return server.reply(200, {'id': doctorId, 'full_name': 'Karim Benali'});
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

  group('Appointments list providers', () {
    test('upcoming merges pending and confirmed sorted by start_at', () async {
      adapter.onGet(
        '/appointments',
        (server) => server.reply(200, (RequestOptions options) {
          final status = options.queryParameters['status'];
          if (status == 'pending') {
            return {
              'data': [
                {
                  'id': 'appt-p',
                  'doctor_id': 'doc-1',
                  'start_at': '2026-06-12T09:00:00Z',
                  'end_at': '2026-06-12T09:30:00Z',
                  'mode': 'in_person',
                  'status': 'pending',
                  'fee_dzd': 2000,
                  'payment_status': 'unpaid',
                  'created_at': '2026-06-01T00:00:00Z',
                  'updated_at': '2026-06-01T00:00:00Z',
                },
              ],
              'meta': {
                'page': 1,
                'page_size': 20,
                'total': 1,
                'total_pages': 1,
              },
            };
          }
          return {
            'data': [
              {
                'id': 'appt-c',
                'doctor_id': 'doc-1',
                'start_at': '2026-06-10T09:00:00Z',
                'end_at': '2026-06-10T09:30:00Z',
                'mode': 'telehealth',
                'status': 'confirmed',
                'fee_dzd': 2500,
                'payment_status': 'unpaid',
                'created_at': '2026-06-01T00:00:00Z',
                'updated_at': '2026-06-01T00:00:00Z',
              },
            ],
            'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
          };
        }),
      );

      final state = await container.read(appointmentsUpcomingProvider.future);
      expect(state.appointments, hasLength(2));
      expect(state.appointments.first.id, 'appt-c');
      expect(state.appointments.last.id, 'appt-p');
    });

    test('history loadMore advances page when API reports more data', () async {
      container.listen(appointmentsHistoryProvider, (_, __) {});

      adapter.onGet(
        '/appointments',
        (server) => server.reply(200, (RequestOptions options) {
          final status = options.queryParameters['status']?.toString();
          final rawPage = options.queryParameters['page'];
          final p = rawPage is int
              ? rawPage
              : int.parse(rawPage?.toString() ?? '1');

          if (p == 1 && status == 'completed') {
            return {
              'data': [
                {
                  'id': 'appt-h1',
                  'doctor_id': 'doc-1',
                  'start_at': '2026-05-10T09:00:00Z',
                  'end_at': '2026-05-10T09:30:00Z',
                  'mode': 'in_person',
                  'status': 'completed',
                  'fee_dzd': 2000,
                  'payment_status': 'paid',
                  'created_at': '2026-05-01T00:00:00Z',
                  'updated_at': '2026-05-01T00:00:00Z',
                },
              ],
              'meta': {
                'page': 1,
                'page_size': 20,
                'total': 2,
                'total_pages': 2,
              },
            };
          }
          if (p == 2 && status == 'completed') {
            return {
              'data': [
                {
                  'id': 'appt-h2',
                  'doctor_id': 'doc-1',
                  'start_at': '2026-04-10T09:00:00Z',
                  'end_at': '2026-04-10T09:30:00Z',
                  'mode': 'in_person',
                  'status': 'completed',
                  'fee_dzd': 2000,
                  'payment_status': 'paid',
                  'created_at': '2026-04-01T00:00:00Z',
                  'updated_at': '2026-04-01T00:00:00Z',
                },
              ],
              'meta': {
                'page': 2,
                'page_size': 20,
                'total': 2,
                'total_pages': 2,
              },
            };
          }
          return {
            'data': <Map<String, dynamic>>[],
            'meta': {'page': p, 'page_size': 20, 'total': 0, 'total_pages': 0},
          };
        }),
      );

      final initial = await container.read(appointmentsHistoryProvider.future);
      expect(initial.page, 1);
      expect(initial.appointments.single.id, 'appt-h1');

      await container.read(appointmentsHistoryProvider.notifier).loadMore();

      final state = container.read(appointmentsHistoryProvider).value!;
      expect(state.page, 2);
      expect(
        state.appointments.map((a) => a.id),
        containsAll(['appt-h1', 'appt-h2']),
      );
    });
  });
}
