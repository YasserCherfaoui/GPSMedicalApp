import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/verification/specialist_verification_repository.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SpecialistVerificationRepository repository;

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
    repository = SpecialistVerificationRepository(client);
  });

  group('mapApiStatus', () {
    test('maps API enums to specialist states', () {
      expect(
        repository.mapApiStatus(DoctorPrivateVerificationStatusEnum.approved),
        SpecialistVerificationStatus.verified,
      );
      expect(
        repository.mapApiStatus(DoctorPrivateVerificationStatusEnum.rejected),
        SpecialistVerificationStatus.rejected,
      );
      expect(
        repository.mapApiStatus(DoctorPrivateVerificationStatusEnum.inReview),
        SpecialistVerificationStatus.moreInfo,
      );
      expect(
        repository.mapApiStatus(DoctorPrivateVerificationStatusEnum.pending),
        SpecialistVerificationStatus.pending,
      );
    });
  });

  group('fetch', () {
    test('returns comment and credential flag from GET /doctors/me', () async {
      adapter.onGet('/doctors/me', (server) {
        server.reply(
          200,
          {
            'id': '00000000-0000-4000-8000-000000000001',
            'full_name': 'Dr. Test',
            'title': 'Dr.',
            'gender': 'male',
            'bio': '',
            'specialties': [],
            'languages': ['fr'],
            'consultation_fee_dzd': 0,
            'accepts_cnas': false,
            'accepts_casnos': false,
            'offers_telehealth': false,
            'rating_average': 0,
            'rating_count': 0,
            'verified': false,
            'phone': '+213555000000',
            'email': 'dr@test.dz',
            'council_number': 'pending',
            'verification_status': 'in_review',
            'verification_comment': '  Merci de renvoyer la carte.  ',
            'credentials': [
              {
                'id': '00000000-0000-4000-8000-000000000099',
                'type': 'diploma',
                'status': 'pending',
              },
            ],
            'confirmation_policy': 'manual',
            'booking_window_days': 30,
          },
        );
      });

      final state = await repository.fetch();

      expect(state.status, SpecialistVerificationStatus.moreInfo);
      expect(state.comment, 'Merci de renvoyer la carte.');
      expect(state.hasSubmittedCredentials, isTrue);
    });

    test('404 maps to pending without credentials', () async {
      adapter.onGet('/doctors/me', (server) {
        server.reply(404, {'title': 'Not found'});
      });

      final state = await repository.fetch();

      expect(state.status, SpecialistVerificationStatus.pending);
      expect(state.hasSubmittedCredentials, isFalse);
    });
  });
}
