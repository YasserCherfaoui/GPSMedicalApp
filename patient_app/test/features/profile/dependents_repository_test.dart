import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/repositories/dependents_repository.dart';
import 'package:patient_app/features/booking/utils/booking_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late DependentsRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = DependentsRepository(client);
  });

  test('createDependent POST returns dependent', () async {
    adapter.onPost('/patients/me/dependents', (server) {
      return server.reply(201, {
        'id': 'dep-new',
        'full_name': 'Amina Benali',
        'relation': 'child',
        'birth_date': '2015-03-10',
        'gender': 'female',
      });
    });

    final created = await repo.createDependent(
      DependentCreate(
        (b) => b
          ..fullName = 'Amina Benali'
          ..relation = DependentCreateRelationEnum.child
          ..birthDate = Date(2015, 3, 10)
          ..gender = DependentCreateGenderEnum.female,
      ),
    );
    expect(created.id, 'dep-new');
  });

  test('updateDependent PATCH returns dependent', () async {
    adapter.onPatch('/patients/me/dependents/dep-1', (server) {
      return server.reply(200, {
        'id': 'dep-1',
        'full_name': 'Amina Updated',
        'relation': 'child',
        'birth_date': '2015-03-10',
        'gender': 'female',
      });
    });

    final updated = await repo.updateDependent(
      dependentId: 'dep-1',
      update: DependentCreate(
        (b) => b
          ..fullName = 'Amina Updated'
          ..relation = DependentCreateRelationEnum.child
          ..birthDate = Date(2015, 3, 10)
          ..gender = DependentCreateGenderEnum.female,
      ),
    );
    expect(updated.fullName, 'Amina Updated');
  });

  test('deleteDependent succeeds on 204', () async {
    adapter.onDelete('/patients/me/dependents/dep-1', (server) {
      return server.reply(204, null);
    });

    await expectLater(repo.deleteDependent('dep-1'), completes);
  });

  test('create maps 422 to BookingValidationException', () async {
    adapter.onPost('/patients/me/dependents', (server) {
      return server.reply(422, {
        'errors': [
          {'field': 'full_name', 'message': 'Too short'},
        ],
      });
    });

    expect(
      () => repo.createDependent(
        DependentCreate(
          (b) => b
            ..fullName = 'A'
            ..relation = DependentCreateRelationEnum.child
            ..birthDate = Date(2015, 3, 10)
            ..gender = DependentCreateGenderEnum.female,
        ),
      ),
      throwsA(isA<BookingValidationException>()),
    );
  });
}
