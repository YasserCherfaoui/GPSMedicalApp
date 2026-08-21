import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/src/client/http_debug_log_interceptor.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  test('gpsHttpDebugLogsEnabled is off outside debug and in tests', () {
    expect(gpsHttpDebugLogsEnabled(debugMode: false, inTest: false), isFalse);
    expect(gpsHttpDebugLogsEnabled(debugMode: true, inTest: true), isFalse);
    expect(gpsHttpDebugLogsEnabled(debugMode: true, inTest: false), isTrue);
  });

  test('redactHeaders hides Authorization', () {
    final redacted = redactHeaders({
      'Authorization': 'Bearer secret-token',
      'Accept': 'application/json',
    });
    expect(redacted['Authorization'], '<redacted>');
    expect(redacted['Accept'], 'application/json');
  });

  test('redactBody hides tokens in JSON maps', () {
    final body = redactBody({
      'full_name': 'Amina',
      'access_token': 'secret',
      'refresh_token': 'secret2',
    });
    expect(body, contains('Amina'));
    expect(body, contains('<redacted>'));
    expect(body, isNot(contains('secret')));
  });

  test('interceptor logs request and successful response', () async {
    final lines = <String>[];
    final dio = Dio(BaseOptions(baseUrl: 'http://example.test'));
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(HttpDebugLogInterceptor(label: 'v1', log: lines.add));

    adapter.onGet(
      '/patients/me',
      (server) => server.reply(200, {'ok': true}),
    );
    await dio.get<void>('/patients/me');

    expect(lines, hasLength(2));
    expect(lines.first, contains('--> GET'));
    expect(lines.first, contains('/patients/me'));
    expect(lines.last, contains('<-- 200'));
    expect(lines.last, contains('"ok": true'));
  });

  test('interceptor logs HTTP errors', () async {
    final lines = <String>[];
    final dio = Dio(BaseOptions(baseUrl: 'http://example.test'));
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(HttpDebugLogInterceptor(label: 'v1', log: lines.add));

    adapter.onGet(
      '/patients/me',
      (server) => server.reply(404, {'title': 'Profil introuvable'}),
    );

    try {
      await dio.get<void>('/patients/me');
    } on DioException {
      // expected
    }

    expect(lines.length, greaterThanOrEqualTo(2));
    expect(lines.last, contains('!!'));
    expect(lines.last, contains('status: 404'));
    expect(lines.last, contains('Profil introuvable'));
  });
}
