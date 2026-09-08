import 'dart:typed_data';

import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Optional seed for [MedicalRecordUploadScreen] (e.g. gallery pick from list FAB).
class MedicalRecordUploadDraft {
  const MedicalRecordUploadDraft({
    this.files = const [],
    this.preferredType,
    this.appointmentId,
  });

  final List<MedicalRecordPickedFile> files;
  final MedicalDocumentTypeEnum? preferredType;

  /// When set, uploads are linked to this appointment so the specialist can
  /// find them in the shared dossier during/after the visit.
  final String? appointmentId;
}

class MedicalRecordPickedFile {
  const MedicalRecordPickedFile({
    required this.fileName,
    required this.bytes,
  });

  final String fileName;
  final Uint8List bytes;
}
