import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/reviews/repositories/reviews_repository.dart';
import 'package:patient_app/features/reviews/utils/reviews_api_error.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ReviewsRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = ReviewsRepository(client);
  });

  test('create posts review and returns pending status', () async {
    adapter.onPost('/reviews', (server) {
      return server.reply(201, {
        'id': 'rev-1',
        'doctor_id': 'doc-1',
        'patient_id': 'pat-1',
        'appointment_id': 'appt-1',
        'rating': 4,
        'comment': 'Très bien',
        'status': 'pending',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    final review = await repo.create(
      appointmentId: 'appt-1',
      rating: 4,
      comment: 'Très bien',
    );
    expect(review.id, 'rev-1');
    expect(review.status, ReviewStatusEnum.pending);
  });

  test('create maps REVIEW_ALREADY_EXISTS to exception', () async {
    adapter.onPost('/reviews', (server) {
      return server.reply(403, {
        'title': 'Avis déjà publié',
        'detail': 'Un avis existe déjà pour ce rendez-vous.',
        'code': 'REVIEW_ALREADY_EXISTS',
      });
    });

    expect(
      () => repo.create(appointmentId: 'appt-1', rating: 5),
      throwsA(isA<ReviewAlreadyExistsException>()),
    );
  });

  test('delete calls DELETE /reviews/{id}', () async {
    adapter.onDelete('/reviews/rev-1', (server) {
      return server.reply(204, null);
    });

    await expectLater(repo.delete('rev-1'), completes);
  });
}
