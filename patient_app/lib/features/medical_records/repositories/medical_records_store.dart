import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

abstract class MedicalRecordsStore {
  Future<({List<MedicalDocument> documents, bool hasMore})> list({
    MedicalDocumentTypeEnum? type,
    required int page,
    int pageSize = 20,
  });

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
  });

  Future<MedicalDocument> fetchById(String documentId);

  Future<Uint8List> fetchDocumentBytes(String documentId);

  Future<void> delete(String documentId);
}
