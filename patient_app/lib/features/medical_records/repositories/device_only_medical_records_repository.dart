import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'medical_records_store.dart';

/// Local list/store/view. Never calls `/medical-records*`.
class DeviceOnlyMedicalRecordsRepository implements MedicalRecordsStore {
  DeviceOnlyMedicalRecordsRepository({
    required DeviceVault vault,
    required String userId,
  }) : _vault = vault,
       _userId = userId;

  final DeviceVault _vault;
  final String _userId;

  @override
  Future<({List<MedicalDocument> documents, bool hasMore})> list({
    MedicalDocumentTypeEnum? type,
    required int page,
    int pageSize = 20,
  }) async {
    var docs = await _vault.listDocuments(_userId);
    if (type != null) {
      docs = docs.where((d) => d.type == type).toList();
    }
    final start = (page - 1) * pageSize;
    if (start >= docs.length) {
      return (documents: <MedicalDocument>[], hasMore: false);
    }
    final slice = docs.skip(start).take(pageSize).toList();
    return (
      documents: [for (final doc in slice) doc.toMedicalDocument()],
      hasMore: start + slice.length < docs.length,
    );
  }

  @override
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
    if (cancelToken?.isCancelled == true) {
      throw DioException(requestOptions: RequestOptions(), error: 'cancelled');
    }
    onSendProgress?.call(0, bytes.length);
    final id = newDeviceVaultId();
    final meta = VaultedMedicalDocument(
      id: id,
      type: type,
      patientId: patientId ?? _userId,
      authorId: _userId,
      fileSize: bytes.length,
      mimeType: mimeType,
      createdAt: DateTime.now().toUtc(),
      title: title,
      notes: notes,
      appointmentId: appointmentId,
      fileName: fileName,
    );
    await _vault.saveDocument(userId: _userId, meta: meta, bytes: bytes);
    onSendProgress?.call(bytes.length, bytes.length);
    return meta.toMedicalDocument();
  }

  @override
  Future<MedicalDocument> fetchById(String documentId) async {
    final meta = await _vault.loadDocumentMeta(_userId, documentId);
    if (meta == null) {
      throw StateError('Medical document not found');
    }
    return meta.toMedicalDocument();
  }

  @override
  Future<Uint8List> fetchDocumentBytes(String documentId) async {
    final bytes = await _vault.loadDocumentBytes(_userId, documentId);
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Empty medical document file response');
    }
    return bytes;
  }

  @override
  Future<void> delete(String documentId) async {
    await _vault.deleteDocument(_userId, documentId);
  }
}
