import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/repositories/device_only_patient_profile_repository.dart';
import 'package:patient_app/features/profile/repositories/patient_repository.dart';
import 'package:patient_app/features/profile/repositories/residency_aware_patient_profile_repository.dart';
import 'package:patient_app/features/profile/utils/profile_api_error.dart';
import '../../test_api_constants.dart';

Map<String, dynamic> _serverPatient({
  String? residency,
  String fullName = 'Amina Benali',
}) {
  return {
    'id': 'pat-1',
    'phone': '+21355001111',
    'email': 'amina@example.dz',
    'role': 'patient',
    'full_name': fullName,
    'status': 'active',
    'created_at': '2026-01-01T00:00:00Z',
    'country': residency == 'device_only' ? 'DZ' : 'TN',
    if (residency != null) 'data_residency_mode': residency,
  };
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PatientRepository server;
  late MemoryDeviceVault vault;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    server = PatientRepository(
      GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio),
    );
    vault = MemoryDeviceVault();
  });

  test('device_only GET merges vault over nulled server fields', () async {
    adapter.onGet('/patients/me', (server) {
      return server.reply(200, _serverPatient(residency: 'device_only'));
    });
    await vault.saveRestrictedProfile(
      'pat-1',
      RestrictedProfileFields(
        birthDate: Date(1990, 5, 12),
        gender: PatientGenderEnum.female,
        bloodType: PatientBloodTypeEnum.oPlus,
      ),
    );

    final repo = DeviceOnlyPatientProfileRepository(
      server: server,
      vault: vault,
    );
    final patient = await repo.getProfile();
    expect(patient.fullName, 'Amina Benali');
    expect(patient.birthDate, Date(1990, 5, 12));
    expect(patient.gender, PatientGenderEnum.female);
    expect(patient.bloodType, PatientBloodTypeEnum.oPlus);
  });

  test('device_only PATCH never sends restricted keys', () async {
    adapter.onGet('/patients/me', (server) {
      return server.reply(200, _serverPatient(residency: 'device_only'));
    });

    String? patchBody;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.method == 'PATCH') {
            patchBody = jsonEncode(options.data);
          }
          handler.next(options);
        },
      ),
    );
    adapter.onPatch('/patients/me', (server) {
      return server.reply(
        200,
        _serverPatient(residency: 'device_only', fullName: 'Amina Updated'),
      );
    });

    final repo = DeviceOnlyPatientProfileRepository(
      server: server,
      vault: vault,
    );
    final updated = await repo.patchProfile(
      PatientUpdate(
        (b) => b
          ..fullName = 'Amina Updated'
          ..birthDate = Date(1990, 5, 12)
          ..gender = PatientUpdateGenderEnum.female
          ..bloodType = PatientUpdateBloodTypeEnum.oPlus
          ..allergies.replace(['Pollen']),
      ),
    );

    expect(updated.fullName, 'Amina Updated');
    expect(updated.birthDate, Date(1990, 5, 12));
    expect(updated.allergies, ['Pollen']);
    expect(patchBody, isNotNull);
    expect(patchBody, contains('full_name'));
    expect(patchBody, isNot(contains('birth_date')));
    expect(patchBody, isNot(contains('blood_type')));
    expect(patchBody, isNot(contains('allergies')));
    expect(patchBody, isNot(contains('gender')));
  });

  test('missing data_residency_mode stays on the server path', () async {
    adapter.onGet('/patients/me', (server) {
      return server.reply(200, _serverPatient());
    });
    adapter.onPatch('/patients/me', (server) {
      return server.reply(422, {
        'errors': [
          {'field': 'blood_type', 'message': 'Groupe sanguin invalide.'},
        ],
      });
    });

    final repo = ResidencyAwarePatientProfileRepository(
      server: server,
      vault: vault,
    );
    await repo.getProfile();
    expect(
      () => repo.patchProfile(
        PatientUpdate((b) => b..bloodType = PatientUpdateBloodTypeEnum.oPlus),
      ),
      throwsA(isA<ProfileValidationException>()),
    );
  });
}
