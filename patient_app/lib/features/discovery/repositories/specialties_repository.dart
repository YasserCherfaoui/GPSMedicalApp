import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialtiesRepository {
  SpecialtiesRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<Specialty>> fetchAll() async {
    final response = await _client.doctors.specialtiesGet();
    return response.data?.toList() ?? [];
  }
}
