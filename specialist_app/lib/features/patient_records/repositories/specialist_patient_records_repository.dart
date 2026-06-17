import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialistPatientRecordsForbidden implements Exception {
  const SpecialistPatientRecordsForbidden();
}

class SpecialistPatientRecordsRepository {
  SpecialistPatientRecordsRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<MedicalDocument> documents, bool hasMore})> listForPatient({
    required String patientId,
    MedicalDocumentTypeEnum? type,
    required int page,
    int pageSize = 20,
  }) async {
    try {
      final response = await _client.medicalRecords.medicalRecordsGet(
        patientId: patientId,
        type: _typeWire(type),
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
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw const SpecialistPatientRecordsForbidden();
      }
      rethrow;
    }
  }

  Future<MedicalDocument> fetchById(String documentId) async {
    final response = await _client.medicalRecords.medicalRecordsDocumentIdGet(
      documentId: documentId,
    );
    final document = response.data;
    if (document == null) {
      throw StateError('Medical document not found');
    }
    return document;
  }

  Future<MedicalRecordsDocumentIdDownloadGet200Response> getDownloadLink(
    String documentId,
  ) async {
    final response = await _client.medicalRecords
        .medicalRecordsDocumentIdDownloadGet(documentId: documentId);
    final link = response.data;
    if (link == null) {
      throw StateError('Empty download link response');
    }
    return link;
  }

  Future<Uint8List> fetchDocumentBytes(String documentId) async {
    var download = await getDownloadLink(documentId);
    var link = _parseSignedDownload(download);

    if (_isLinkExpired(link.expiresAt)) {
      download = await getDownloadLink(documentId);
      link = _parseSignedDownload(download);
    }

    try {
      return await _fetchFileBytes(documentId: documentId, link: link);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 403 || status == 401 || status == null) {
        download = await getDownloadLink(documentId);
        link = _parseSignedDownload(download);
        return _fetchFileBytes(documentId: documentId, link: link);
      }
      rethrow;
    }
  }

  Future<Uint8List> _fetchFileBytes({
    required String documentId,
    required _SignedLink link,
  }) async {
    final response = await _client.medicalRecords.getMedicalDocumentFile(
      documentId: documentId,
      exp: link.exp,
      token: link.token,
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Empty medical document file response');
    }
    return bytes;
  }

  String? _typeWire(MedicalDocumentTypeEnum? type) {
    if (type == null) return null;
    return switch (type) {
      MedicalDocumentTypeEnum.prescription => 'prescription',
      MedicalDocumentTypeEnum.report => 'report',
      MedicalDocumentTypeEnum.labResult => 'lab_result',
      MedicalDocumentTypeEnum.imaging => 'imaging',
      MedicalDocumentTypeEnum.certificate => 'certificate',
      _ => 'other',
    };
  }
}

class _SignedLink {
  const _SignedLink({
    required this.exp,
    required this.token,
    required this.expiresAt,
  });

  final int exp;
  final String token;
  final DateTime? expiresAt;
}

_SignedLink _parseSignedDownload(
  MedicalRecordsDocumentIdDownloadGet200Response response,
) {
  final url = response.url;
  if (url == null || url.isEmpty) {
    throw const FormatException('Missing download url');
  }
  final uri = url.startsWith('http')
      ? Uri.parse(url)
      : Uri.parse('https://api.gpsmedical.dz$url');
  final expRaw = uri.queryParameters['exp'];
  final token = uri.queryParameters['token'];
  if (expRaw == null || token == null || token.isEmpty) {
    throw const FormatException('Missing signed download parameters');
  }
  return _SignedLink(
    exp: int.parse(expRaw),
    token: token,
    expiresAt: response.expiresAt,
  );
}

bool _isLinkExpired(DateTime? expiresAt) {
  if (expiresAt == null) return false;
  return DateTime.now().toUtc().isAfter(expiresAt.toUtc());
}
