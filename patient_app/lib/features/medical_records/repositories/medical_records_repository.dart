import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_parser/http_parser.dart';

import '../utils/medical_record_display.dart';
import '../utils/medical_record_download.dart';
import '../utils/medical_records_api_error.dart';

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

  Future<MedicalDocument> upload({
    required Uint8List bytes,
    required String fileName,
    required String mimeType,
    required MedicalDocumentTypeEnum type,
    String? appointmentId,
    String? patientId,
    String? title,
    String? notes,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final wireType = medicalDocumentTypeWireName(type);
      if (wireType == null) {
        throw ArgumentError.value(type, 'type', 'Upload type is required');
      }
      final response = await _client.medicalRecords.medicalRecordsPost(
        file: MultipartFile.fromBytes(
          bytes,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        ),
        type: wireType,
        appointmentId: appointmentId,
        patientId: patientId,
        title: title,
        notes: notes,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      final document = response.data;
      if (document == null) {
        throw StateError('Empty medical document response');
      }
      return document;
    } catch (e) {
      rethrowMedicalRecordsApiError(e);
    }
  }

  Future<MedicalDocument> fetchById(String documentId) async {
    try {
      final response = await _client.medicalRecords.medicalRecordsDocumentIdGet(
        documentId: documentId,
      );
      final document = response.data;
      if (document == null) {
        throw StateError('Medical document not found');
      }
      return document;
    } catch (e) {
      rethrowMedicalRecordsApiError(e);
    }
  }

  Future<MedicalRecordsDocumentIdDownloadGet200Response> getDownloadLink(
    String documentId,
  ) async {
    try {
      final response = await _client.medicalRecords
          .medicalRecordsDocumentIdDownloadGet(documentId: documentId);
      final link = response.data;
      if (link == null) {
        throw StateError('Empty download link response');
      }
      return link;
    } catch (e) {
      rethrowMedicalRecordsApiError(e);
    }
  }

  Future<Uint8List> fetchFileBytes({
    required String documentId,
    required SignedMedicalRecordFileLink link,
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

  Future<Uint8List> fetchDocumentBytes(String documentId) async {
    var download = await getDownloadLink(documentId);
    var link = parseSignedMedicalRecordDownload(download);

    if (isSignedMedicalRecordLinkExpired(link.expiresAt)) {
      download = await getDownloadLink(documentId);
      link = parseSignedMedicalRecordDownload(download);
    }

    try {
      return await fetchFileBytes(documentId: documentId, link: link);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 403 || status == 401 || status == null) {
        download = await getDownloadLink(documentId);
        link = parseSignedMedicalRecordDownload(download);
        try {
          return await fetchFileBytes(documentId: documentId, link: link);
        } on DioException catch (retryError) {
          rethrowMedicalRecordsApiError(retryError);
        }
      }
      rethrowMedicalRecordsApiError(e);
    }
  }

  Future<void> delete(String documentId) async {
    try {
      await _client.medicalRecords.medicalRecordsDocumentIdDelete(
        documentId: documentId,
      );
    } catch (e) {
      rethrowMedicalRecordsApiError(e);
    }
  }
}
