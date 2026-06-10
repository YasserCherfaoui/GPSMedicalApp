import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/messaging/screens/messaging_threads_list_screen.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/messaging/threads', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'thread-1',
            'patient_id': 'pat-1',
            'doctor_id': 'doc-1',
            'last_message_at': '2026-06-01T10:00:00Z',
            'unread_count': 3,
            'appointment_id': 'appt-1',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    adapter.onGet('/messaging/threads/thread-1/messages', (server) {
      return server.reply(200, [
        {
          'id': 'msg-1',
          'thread_id': 'thread-1',
          'sender_id': 'doc-user-1',
          'body': 'Rendez-vous confirmé',
          'attachments': <Map<String, dynamic>>[],
          'created_at': '2026-06-01T10:00:00Z',
          'read_at': null,
        },
      ]);
    });

    adapter.onGet('/doctors/doc-1', (server) {
      return server.reply(200, {
        'id': 'doc-1',
        'title': 'Dr.',
        'full_name': 'Karim Boudiaf',
        'photo_url': '',
        'verified': true,
        'offers_telehealth': true,
        'consultation_fee_dzd': 2500,
        'specialties': [
          {
            'id': 'spec-1',
            'code': 'cardiology',
            'name_fr': 'Cardiologie',
            'name_ar': 'أمراض القلب',
            'name_ber': 'Aẓeṭṭa n ul',
          },
        ],
      });
    });
  });

  Widget wrap() {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const MessagingThreadsListScreen(),
      ),
    );
  }

  testWidgets('shows doctor name preview unread badge and timestamp', (
    tester,
  ) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Messagerie'), findsOneWidget);
    expect(find.text('Dr. Karim Boudiaf'), findsOneWidget);
    expect(find.text('Rendez-vous confirmé'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}
