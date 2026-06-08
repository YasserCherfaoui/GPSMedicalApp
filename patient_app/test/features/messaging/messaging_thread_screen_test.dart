import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/messaging/screens/messaging_thread_screen.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/patients/me', (server) {
      return server.reply(200, {
        'id': 'user-patient-1',
        'phone': '+21355001111',
        'role': 'patient',
        'full_name': 'Amina Benali',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
      });
    });

    adapter.onGet('/messaging/threads/thread-1', (server) {
      return server.reply(200, {
        'id': 'thread-1',
        'patient_id': 'pat-1',
        'doctor_id': 'doc-1',
        'last_message_at': '2026-06-01T10:00:00Z',
        'unread_count': 1,
      });
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
        'specialties': [],
      });
    });

    adapter.onGet('/messaging/threads/thread-1/messages', (server) {
      return server.reply(200, [
        {
          'id': 'msg-1',
          'thread_id': 'thread-1',
          'sender_id': 'doc-user-1',
          'body': 'Bonjour Amina',
          'attachments': [],
          'created_at': '2026-06-01T09:00:00Z',
          'read_at': null,
        },
        {
          'id': 'msg-2',
          'thread_id': 'thread-1',
          'sender_id': 'user-patient-1',
          'body': 'Bonjour docteur',
          'attachments': [],
          'created_at': '2026-06-01T09:30:00Z',
          'read_at': '2026-06-01T09:35:00Z',
        },
      ]);
    });

    adapter.onPost('/messaging/messages/msg-1/read', (server) {
      return server.reply(204, null);
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
        home: const MessagingThreadScreen(threadId: 'thread-1'),
      ),
    );
  }

  testWidgets('shows chronological bubbles and composer', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Dr. Karim Boudiaf'), findsOneWidget);
    expect(find.text('Bonjour Amina'), findsOneWidget);
    expect(find.text('Bonjour docteur'), findsOneWidget);
    expect(find.text('Lu'), findsOneWidget);
    expect(find.byIcon(Icons.attach_file_outlined), findsOneWidget);
    expect(find.text('Écrire un message…'), findsOneWidget);
  });
}
