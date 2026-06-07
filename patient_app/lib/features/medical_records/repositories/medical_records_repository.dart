import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/medical_record_display.dart';

class MedicalRecordsRepository {
  MedicalRecordsRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<MedicalDocument> documents, bool hasMore})> list({
    MedicalDocumentTypeEnum? type,
    required int page,
    int pageSize = 20,
  }) async {
    final response = await _client.medicalRecords.medicalRecordsGet(
      type: medicalDocumentTypeWireName(type),
      page: page,
      pageSize: pageSize,
    );
    final paginated = response.data;
    final items = paginated?.data?.toList() ?? [];
    final meta = paginated?.meta;
    final total = meta?.total ?? items.length;
    final currentPage = meta?.page ?? page;
    final size = meta?.pageSize ?? pageSize;
    final totalPages = meta?.totalPages;
    final hasMore = totalPages != null
        ? currentPage < totalPages
        : currentPage * size < total;
    return (documents: items, hasMore: hasMore);
  }
}
