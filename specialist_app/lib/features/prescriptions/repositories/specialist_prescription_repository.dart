import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class PrescriptionSubmitException implements Exception {
  const PrescriptionSubmitException(this.message);

  final String message;
}

class SpecialistPrescriptionRepository {
  SpecialistPrescriptionRepository(this._client);

  final GpsMedicalClient _client;

  Future<Prescription> create({
    required String appointmentId,
    required List<PrescriptionItem> items,
    String? diagnosis,
    Date? validUntil,
  }) async {
    try {
      final create = $PrescriptionCreate((b) {
        b
          ..appointmentId = appointmentId
          ..diagnosis = diagnosis
          ..validUntil = validUntil
          ..items.replace(BuiltList<PrescriptionItem>(items));
      });
      final response = await _client.medicalRecords.prescriptionsPost(
        prescriptionCreate: create,
      );
      final prescription = response.data;
      if (prescription == null) {
        throw StateError('Empty prescription response');
      }
      return prescription;
    } on DioException catch (e) {
      final data = e.response?.data;
      final map = data is Map
          ? data.map((k, v) => MapEntry(k.toString(), v))
          : null;
      final detail = map?['detail'] as String? ?? map?['title'] as String?;
      throw PrescriptionSubmitException(
        detail ?? 'Impossible de créer l\'ordonnance',
      );
    }
  }
}
