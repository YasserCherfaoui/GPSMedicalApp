import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Dio URL resolution test', () async {
    final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ignore: avoid_print
          print('REQUEST URI: ${options.uri}');
          handler.next(options);
        },
      ),
    );
    try {
      await dio.get<void>('/geo/doctors/nearby');
    } catch (_) {}
  });
}
