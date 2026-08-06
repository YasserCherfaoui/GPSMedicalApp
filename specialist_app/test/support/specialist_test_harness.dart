import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const kSpecialistTestApiRoot = 'http://localhost:8080';
const kSpecialistTestApiV1 = '$kSpecialistTestApiRoot/v1';

Map<String, dynamic> emptyPaginated({int pageSize = 20}) => {
      'data': <Map<String, dynamic>>[],
      'meta': {
        'page': 1,
        'page_size': pageSize,
        'total': 0,
        'total_pages': 0,
      },
    };

Map<String, dynamic> minimalDoctorProfile({
  String id = '00000000-0000-4000-8000-000000000010',
  String verificationStatus = 'approved',
  List<Map<String, dynamic>>? credentials,
  List<Map<String, dynamic>>? specialties,
}) =>
    {
      'id': id,
      'full_name': 'Test Specialist',
      'title': 'Dr.',
      'gender': 'male',
      'bio': 'Bio test',
      'specialties': specialties ??
          [
            {
              'id': '00000000-0000-4000-8000-000000000001',
              'code': 'CAR',
              'name_fr': 'Cardiologie',
              'name_ar': 'طب القلب',
            },
          ],
      'languages': ['fr', 'ar'],
      'consultation_fee_dzd': 2500,
      'accepts_cnas': true,
      'accepts_casnos': false,
      'offers_telehealth': true,
      'rating_average': 4.5,
      'rating_count': 12,
      'verified': verificationStatus == 'approved',
      'phone': '+213551000001',
      'email': 'specialist@test.dz',
      'council_number': '16-44521',
      'verification_status': verificationStatus,
      'credentials': credentials ?? <Map<String, dynamic>>[],
      'confirmation_policy': 'manual',
      'booking_window_days': 30,
    };

Map<String, dynamic> minimalAppointmentJson({
  String id = '00000000-0000-4000-8000-000000000099',
  String status = 'pending',
  String mode = 'in_person',
  String? patientId = '00000000-0000-4000-8000-000000000050',
  String startAt = '2026-06-20T09:00:00Z',
  String endAt = '2026-06-20T09:30:00Z',
}) =>
    {
      'id': id,
      'patient_id': patientId,
      'doctor_id': '00000000-0000-4000-8000-000000000010',
      'status': status,
      'mode': mode,
      'start_at': startAt,
      'end_at': endAt,
      'fee_dzd': 2500,
      'payment_status': 'unpaid',
      'reason': 'Consultation de suivi',
      'created_at': '2026-06-01T00:00:00Z',
      'updated_at': '2026-06-01T00:00:00Z',
    };

/// Shared Dio + Riverpod + MaterialApp harness for specialist feature widget tests.
class SpecialistTestHarness {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  void setUpClient() {
    dio = Dio(BaseOptions(baseUrl: kSpecialistTestApiV1));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
      apiRootUrl: kSpecialistTestApiRoot,
    );
    client.applyBearerToken('specialist-test-token');
  }

  void mockEmptyAppointments() {
    adapter.onGet('/appointments', (server) {
      return server.reply(200, emptyPaginated());
    });
  }

  void mockDoctorMe([Map<String, dynamic>? body]) {
    adapter.onGet('/doctors/me', (server) {
      return server.reply(200, body ?? minimalDoctorProfile());
    });
  }

  void mockSpecialties([List<Map<String, dynamic>>? items]) {
    adapter.onGet('/specialties', (server) {
      return server.reply(
        200,
        items ??
            [
              {
                'id': '00000000-0000-4000-8000-000000000001',
                'code': 'CAR',
                'name_fr': 'Cardiologie',
                'name_ar': 'طب القلب',
              },
            ],
      );
    });
  }

  void mockEmptySchedule() {
    adapter.onGet('/doctors/me/schedule/templates', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
    adapter.onGet('/doctors/me/schedule/exceptions', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
  }

  void mockEmptyStats({String doctorId = '00000000-0000-4000-8000-000000000010'}) {
    adapter.onGet('/analytics/doctor/overview', (server) {
      return server.reply(200, {
        'appointments_total': 0,
        'appointments_completed': 0,
        'revenue_dzd': 0,
        'no_show_rate': 0,
      });
    });
    adapter.onGet('/analytics/doctor/timeseries', (server) {
      return server.reply(200, {
        'metric': 'appointments',
        'granularity': 'week',
        'points': <Map<String, dynamic>>[],
      });
    });
    adapter.onGet('/doctors/$doctorId/reviews', (server) {
      return server.reply(200, emptyPaginated());
    });
  }

  void mockEmptyNotifications() {
    adapter.onGet('/notifications', (server) {
      return server.reply(200, emptyPaginated());
    });
  }

  void mockEmptyMessagingThreads() {
    adapter.onGet('/messaging/threads', (server) {
      return server.reply(200, emptyPaginated());
    });
  }

  void mockEmptyWilayas() {
    adapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
  }

  void mockWilayasAndCommunes() {
    adapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [
        {
          'code': '16',
          'name_fr': 'Alger',
          'name_ar': 'الجزائر',
          'latitude': 36.7538,
          'longitude': 3.0588,
        },
        {
          'code': '31',
          'name_fr': 'Oran',
          'name_ar': 'وهران',
          'latitude': 35.6971,
          'longitude': -0.6308,
        },
      ]);
    });
    adapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000016',
          'wilaya_code': '16',
          'name_fr': 'Alger Centre',
          'name_ar': 'الجزائر الوسطى',
          'latitude': 36.7538,
          'longitude': 3.0588,
        },
      ]);
    });
    adapter.onGet('/geo/wilayas/31/communes', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000031',
          'wilaya_code': '31',
          'name_fr': 'Oran Centre',
          'name_ar': 'وهران',
          'latitude': 35.6971,
          'longitude': -0.6308,
        },
      ]);
    });
  }

  /// Large phone-like surface to avoid overflow in tabbed screens.
  void setLargeSurface(WidgetTester tester) {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  }

  Widget wrapScreen(
    Widget child, {
    List<Override> overrides = const [],
    Locale locale = const Locale('fr'),
  }) {
    return ProviderScope(
      overrides: [
        gpsMedicalClientProvider.overrideWithValue(client),
        ...overrides,
      ],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: child,
      ),
    );
  }

  /// Wraps [child] in a minimal GoRouter for screens that call context.push/go.
  Widget wrapWithRouter(
    Widget child, {
    List<Override> overrides = const [],
    Locale locale = const Locale('fr'),
    List<RouteBase> extraRoutes = const [],
    String initialLocation = '/',
  }) {
    final router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(path: '/', builder: (context, state) => child),
        ...extraRoutes,
      ],
    );
    return ProviderScope(
      overrides: [
        gpsMedicalClientProvider.overrideWithValue(client),
        ...overrides,
      ],
      child: MaterialApp.router(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        routerConfig: router,
      ),
    );
  }
}

Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 50));
    if (finder.evaluate().isNotEmpty) return;
  }
  expect(finder, findsWidgets);
}
