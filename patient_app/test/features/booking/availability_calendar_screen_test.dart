import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/screens/availability_calendar_screen.dart';
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

  Widget wrap({
    required String doctorId,
    String modeFilter = 'both',
    Locale locale = const Locale('fr'),
  }) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: AvailabilityCalendarScreen(
          doctorId: doctorId,
          modeFilter: modeFilter,
        ),
      ),
    );
  }

  void mockDoctor(String doctorId) {
    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
        'verified': true,
        'consultation_fee_dzd': 2500,
        'specialties': [
          {
            'id': 'spec-1',
            'code': 'CAR',
            'name_fr': 'Cardiologie',
          },
        ],
      });
    });
    adapter.onGet('/doctors/$doctorId/reviews', (server) {
      return server.reply(200, {
        'data': [],
        'meta': {'page': 1, 'page_size': 10, 'total': 0, 'total_pages': 0},
      });
    });
  }

  void mockAvailability(String doctorId) {
    final slotDay = DateTime.now().add(const Duration(days: 2)).toUtc();
    adapter.onGet('/doctors/$doctorId/availability', (server) {
      return server.reply(200, [
        {
          'start_at': slotDay.toIso8601String(),
          'end_at': slotDay.add(const Duration(minutes: 30)).toIso8601String(),
          'mode': 'in_person',
          'slot_lock_token': 'lock-1',
        },
      ]);
    });
  }

  testWidgets('shows localized title and doctor header with slots', (
    tester,
  ) async {
    const doctorId = 'doc-cal-1';
    mockDoctor(doctorId);
    mockAvailability(doctorId);

    await tester.pumpWidget(wrap(doctorId: doctorId));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Choisir un créneau'), findsOneWidget);
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.textContaining('créneau'), findsWidgets);
  });

  testWidgets('telehealth route hides mode segmented filter', (tester) async {
    const doctorId = 'doc-cal-2';
    mockDoctor(doctorId);
    mockAvailability(doctorId);

    await tester.pumpWidget(
      wrap(doctorId: doctorId, modeFilter: 'telehealth'),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(SegmentedButton<String>), findsNothing);
  });
}
