import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/profile/repositories/specialist_profile_repository.dart';
import 'package:specialist_app/features/profile/utils/profile_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SpecialistProfileRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
      apiRootUrl: 'http://localhost:8080',
    );
    client.applyBearerToken('test-token');
    repository = SpecialistProfileRepository(client);
  });

  test('patchProfileRaw maps 422 to ProfileValidationException', () async {
    adapter.onPatch('/doctors/me', (server) {
      server.reply(422, {
        'title': 'Champs invalides',
        'status': 422,
        'errors': [
          {'field': 'bio', 'message': 'Trop long', 'code': 'INVALID_BIO'},
        ],
      });
    });

    expect(
      () => repository.patchProfileRaw({'bio': 'x'}),
      throwsA(
        isA<ProfileValidationException>().having(
          (e) => e.fieldErrors['bio'],
          'bio',
          'Trop long',
        ),
      ),
    );
  });

  test('buildPatchBody includes full_name and specialty_ids', () {
    final body = repository.buildPatchBody(
      fullName: 'Dr. Test',
      specialtyId: '00000000-0000-4000-8000-000000000001',
      consultationFeeDzd: 2500,
    );

    expect(body['full_name'], 'Dr. Test');
    expect(body['specialty_ids'], ['00000000-0000-4000-8000-000000000001']);
    expect(body['consultation_fee_dzd'], 2500);
  });
}
