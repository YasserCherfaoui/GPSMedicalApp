import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialtiesRepository {
  SpecialtiesRepository(this._client);

  final GpsMedicalClient _client;
  List<Specialty>? _cache;

  Future<List<Specialty>> fetchAll({bool forceRefresh = false}) async {
    if (!forceRefresh && _cache != null) {
      return _cache!;
    }

    final response = await _client.doctors.specialtiesGet();
    _cache = response.data?.toList() ?? [];

    return _cache!;
  }

  void clearCache() {
    _cache = null;
  }
}
