import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/screens/appointments_list_screen.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
  });

  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: child,
      ),
    );
  }

  void mockEmptyUpcoming() {
    adapter.onGet(
      '/appointments',
      (server) => server.reply(200, {
        'data': <Map<String, dynamic>>[],
        'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
      }),
    );
  }

  void mockUpcomingWithDoctor() {
    const doctorId = 'doc-list-1';
    adapter.onGet(
      '/appointments',
      (server) => server.reply(200, (RequestOptions options) {
        final status = options.queryParameters['status'];
        if (status == 'confirmed') {
          return {
            'data': <Map<String, dynamic>>[],
            'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
          };
        }
        return {
          'data': [
            {
              'id': 'appt-1',
              'doctor_id': doctorId,
              'start_at': '2026-06-10T09:00:00Z',
              'end_at': '2026-06-10T09:30:00Z',
              'mode': 'in_person',
              'status': 'pending',
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
    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
        'specialties': [
          {'id': 's1', 'code': 'CAR', 'name_fr': 'Cardiologie'},
        ],
      });
    });
  }

  void mockUpcomingWithClinic() {
    const clinicId = 'clinic-list-1';
    adapter.onGet(
      '/appointments',
      (server) => server.reply(200, (RequestOptions options) {
        final status = options.queryParameters['status'];
        if (status == 'confirmed') {
          return {
            'data': <Map<String, dynamic>>[],
            'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
          };
        }
        return {
          'data': [
            {
              'id': 'appt-clinic-1',
              'doctor_id': null,
              'clinic_id': clinicId,
              'service_id': 'svc-1',
              'origin': 'clinic_service',
              'start_at': '2026-09-07T08:00:00Z',
              'end_at': '2026-09-07T08:30:00Z',
              'mode': 'in_person',
              'status': 'pending',
              'fee_dzd': 3000,
              'payment_status': 'unpaid',
              'created_at': '2026-09-07T00:00:00Z',
              'updated_at': '2026-09-07T00:00:00Z',
            },
          ],
          'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
        };
      }),
    );
    adapter.onGet('/clinics/$clinicId', (server) {
      return server.reply(200, {
        'id': clinicId,
        'name': 'Clinique El Amel',
        'country_code': 'DZ',
        'status': 'active',
        'verification_status': 'verified',
      });
    });
  }

  void mockUpcomingWithClinicAssignedEu() {
    const clinicId = 'clinic-eu-1';
    const doctorId = 'doc-eu-1';
    adapter.onGet(
      '/appointments',
      (server) => server.reply(200, (RequestOptions options) {
        final status = options.queryParameters['status'];
        if (status == 'confirmed') {
          return {
            'data': <Map<String, dynamic>>[],
            'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
          };
        }
        return {
          'data': [
            {
              'id': 'appt-clinic-eu-1',
              'doctor_id': doctorId,
              'clinic_id': clinicId,
              'service_id': 'svc-eu-1',
              'origin': 'clinic_service',
              'start_at': '2026-09-07T10:00:00Z',
              'end_at': '2026-09-07T10:30:00Z',
              'mode': 'telehealth',
              'status': 'confirmed',
              'fee_dzd': 20,
              'payment_status': 'paid',
              'created_at': '2026-09-07T00:00:00Z',
              'updated_at': '2026-09-07T00:00:00Z',
            },
          ],
          'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
        };
      }),
    );
    adapter.onGet('/clinics/$clinicId', (server) {
      return server.reply(200, {
        'id': clinicId,
        'name': 'Clinique Cherfaoui',
        'country_code': 'FR',
        'status': 'active',
        'verification_status': 'verified',
      });
    });
    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Ahmed D.',
        'title': 'Dr.',
        'specialties': [
          {'id': 's1', 'code': 'MG', 'name_fr': 'Médecine générale'},
        ],
      });
    });
  }

  testWidgets('shows tabs and empty upcoming CTA to search', (tester) async {
    mockEmptyUpcoming();

    await tester.pumpWidget(wrap(const AppointmentsListScreen()));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Rendez-vous'), findsOneWidget);
    expect(find.text('À venir'), findsOneWidget);
    expect(find.text('Historique'), findsOneWidget);
    expect(find.text('Aucun rendez-vous à venir'), findsOneWidget);
    expect(find.text('Trouver un spécialiste'), findsOneWidget);
  });

  testWidgets('upcoming row shows doctor specialty mode status and fee', (
    tester,
  ) async {
    mockUpcomingWithDoctor();

    await tester.pumpWidget(wrap(const AppointmentsListScreen()));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.text('Cardiologie'), findsOneWidget);
    expect(find.text('2500 DZD'), findsOneWidget);
    expect(find.text('En attente'), findsOneWidget);
    expect(find.text('En présentiel'), findsOneWidget);
  });

  testWidgets('upcoming row shows clinic booking without doctor', (
    tester,
  ) async {
    mockUpcomingWithClinic();

    await tester.pumpWidget(wrap(const AppointmentsListScreen()));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Clinique El Amel'), findsOneWidget);
    expect(find.text('3000 DZD'), findsOneWidget);
    expect(find.text('Réservation clinique'), findsOneWidget);
    expect(find.text('En attente'), findsOneWidget);
    expect(find.textContaining('Dr.'), findsNothing);
  });

  testWidgets(
    'clinic booking with assigned doctor stays clinic-branded and uses EUR',
    (tester) async {
      mockUpcomingWithClinicAssignedEu();

      await tester.pumpWidget(wrap(const AppointmentsListScreen()));
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Clinique Cherfaoui'), findsOneWidget);
      expect(find.textContaining('Dr. Ahmed D.'), findsOneWidget);
      expect(find.text('Réservation clinique'), findsOneWidget);
      expect(find.text('20 DZD'), findsNothing);
      expect(find.textContaining('20'), findsWidgets);
      expect(find.textContaining('€'), findsOneWidget);
    },
  );
}
