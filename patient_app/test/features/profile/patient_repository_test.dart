import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/repositories/patient_repository.dart';
import 'package:patient_app/features/profile/utils/profile_api_error.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PatientRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = PatientRepository(client);
  });

  test('getProfile returns patient', () async {
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
        'allergies': ['Pollen'],
        'chronic_conditions': [],
        'insurance': {'provider': 'cnas', 'number': '12345'},
      });
    });

    final patient = await repo.getProfile();
    expect(patient.id, 'pat-1');
    expect(patient.fullName, 'Amina Benali');
    expect(patient.allergies, ['Pollen']);
  });

  test('patchProfile sends PatientUpdate fields', () async {
    adapter.onPatch('/patients/me', (server) {
      return server.reply(200, {
        'id': 'pat-1',
        'phone': '+21355001111',
        'role': 'patient',
        'full_name': 'Amina Updated',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
      });
    });

    final updated = await repo.patchProfile(
      PatientUpdate((b) => b..fullName = 'Amina Updated'),
    );
    expect(updated.fullName, 'Amina Updated');
  });

  test('patchProfile maps 422 to ProfileValidationException', () async {
    adapter.onPatch('/patients/me', (server) {
      return server.reply(422, {
        'errors': [
          {'field': 'email', 'message': 'Invalid email'},
        ],
      });
    });

    expect(
      () => repo.patchProfile(PatientUpdate((b) => b..email = 'bad')),
      throwsA(isA<ProfileValidationException>()),
    );
  });

  test('patchProfile maps blood_type 422 field error', () async {
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

    try {
      await repo.patchProfile(PatientUpdate((b) => b..fullName = 'Amina'));
      fail('expected ProfileValidationException');
    } on ProfileValidationException catch (e) {
      expect(e.fieldErrors['blood_type'], 'Groupe sanguin invalide.');
    }
  });

  test('patchProfile maps address.line1 422 field error', () async {
    adapter.onPatch('/patients/me', (server) {
      return server.reply(422, {
        'errors': [
          {
            'field': 'address.line1',
            'message': 'La rue est obligatoire.',
          },
        ],
      });
    });

    try {
      await repo.patchProfile(
        PatientUpdate(
          (b) => b.address.replace(
            Address((a) => a..line1 = ''),
          ),
        ),
      );
      fail('expected ProfileValidationException');
    } on ProfileValidationException catch (e) {
      expect(e.fieldErrors['address.line1'], 'La rue est obligatoire.');
    }
  });

  test('deleteProfile succeeds on 204', () async {
    adapter.onDelete('/patients/me', (server) => server.reply(204, null));

    await expectLater(repo.deleteProfile(), completes);
  });
}
