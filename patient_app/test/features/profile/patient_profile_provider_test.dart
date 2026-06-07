import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/providers/patient_profile.provider.dart';
import 'package:patient_app/features/profile/utils/profile_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;
  late ProviderContainer container;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    container = ProviderContainer(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
    );

    adapter.onGet('/patients/me', (server) {
      return server.reply(200, {
        'id': 'pat-1',
        'phone': '+21355001111',
        'email': 'amina@example.dz',
        'role': 'patient',
        'full_name': 'Amina Benali',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
        'birth_date': '1990-05-12',
        'gender': 'female',
        'blood_type': 'O+',
      });
    });
  });

  tearDown(() => container.dispose());

  test('patchProfile rethrows blood_type field errors', () async {
    adapter.onPatch('/patients/me', (server) {
      return server.reply(422, {
        'errors': [
          {
            'field': 'blood_type',
            'message': 'Groupe sanguin invalide.',
          },
        ],
      });
    });

    await container.read(patientProfileProvider.future);

    expect(
      () => container.read(patientProfileProvider.notifier).patchProfile(
        PatientUpdate((b) => b..fullName = 'Amina Benali'),
      ),
      throwsA(
        isA<ProfileValidationException>().having(
          (e) => e.fieldErrors['blood_type'],
          'blood_type',
          'Groupe sanguin invalide.',
        ),
      ),
    );
  });
}
