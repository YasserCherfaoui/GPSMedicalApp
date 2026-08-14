import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../profile/repositories/patient_profile_repository.dart';
import 'device_only_medical_records_repository.dart';
import 'medical_records_store.dart';

/// Resolves `device_only` vs server **before** any `/medical-records*` call.
class ResidencyAwareMedicalRecordsRepository implements MedicalRecordsStore {
  ResidencyAwareMedicalRecordsRepository({
    required MedicalRecordsStore server,
    required DeviceVault vault,
    required PatientProfileRepository profiles,
  }) : _server = server,
       _vault = vault,
       _profiles = profiles;

  final MedicalRecordsStore _server;
  final DeviceVault _vault;
  final PatientProfileRepository _profiles;
  MedicalRecordsStore? _resolved;

  Future<MedicalRecordsStore> _store() async {
    if (_resolved != null) return _resolved!;
    final patient = await _profiles.getProfile();
    if (isDeviceOnlyResidency(patient) &&
        patient.id != null &&
        patient.id!.isNotEmpty) {
      _resolved = DeviceOnlyMedicalRecordsRepository(
        vault: _vault,
        userId: patient.id!,
      );
    } else {
      _resolved = _server;
    }
    return _resolved!;
  }

  @override
  Future<({List<MedicalDocument> documents, bool hasMore})> list({
    MedicalDocumentTypeEnum? type,
    required int page,
    int pageSize = 20,
  }) async {
    return (await _store()).list(type: type, page: page, pageSize: pageSize);
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
    return (await _store()).upload(
      bytes: bytes,
      fileName: fileName,
      mimeType: mimeType,
      type: type,
      appointmentId: appointmentId,
      patientId: patientId,
      title: title,
      notes: notes,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<MedicalDocument> fetchById(String documentId) async {
    return (await _store()).fetchById(documentId);
  }

  @override
  Future<Uint8List> fetchDocumentBytes(String documentId) async {
    return (await _store()).fetchDocumentBytes(documentId);
  }

  @override
  Future<void> delete(String documentId) async {
    await (await _store()).delete(documentId);
  }
}
