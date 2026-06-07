import 'dart:typed_data';

import 'package:gps_medical_shared/gps_medical_shared.dart';

const medicalRecordMaxFileBytes = 20 * 1024 * 1024;
const medicalRecordMaxFilesPerSession = 5;
const medicalRecordMaxTitleLength = 200;
const medicalRecordMaxNotesLength = 2000;

const medicalRecordAllowedMimeTypes = {
  'application/pdf',
  'image/jpeg',
  'image/png',
};

/// Document types available in the upload form (excludes the list "All" chip).
const medicalRecordUploadTypes = <MedicalDocumentTypeEnum>[
  MedicalDocumentTypeEnum.prescription,
  MedicalDocumentTypeEnum.report,
  MedicalDocumentTypeEnum.labResult,
  MedicalDocumentTypeEnum.imaging,
  MedicalDocumentTypeEnum.certificate,
  MedicalDocumentTypeEnum.other,
];

String? detectMedicalRecordMimeType(Uint8List bytes) {
  if (bytes.length >= 4 &&
      bytes[0] == 0x25 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x44 &&
      bytes[3] == 0x46) {
    return 'application/pdf';
  }
  if (bytes.length >= 3 &&
      bytes[0] == 0xFF &&
      bytes[1] == 0xD8 &&
      bytes[2] == 0xFF) {
    return 'image/jpeg';
  }
  if (bytes.length >= 8 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47 &&
      bytes[4] == 0x0D &&
      bytes[5] == 0x0A &&
      bytes[6] == 0x1A &&
      bytes[7] == 0x0A) {
    return 'image/png';
  }
  return null;
}

String? validateMedicalRecordFileBytes({
  required Uint8List bytes,
  required AppLocalizations l10n,
}) {
  if (bytes.length > medicalRecordMaxFileBytes) {
    return l10n.medicalRecordUploadFileTooLarge;
  }
  final mime = detectMedicalRecordMimeType(bytes);
  if (mime == null || !medicalRecordAllowedMimeTypes.contains(mime)) {
    return l10n.medicalRecordUploadInvalidMime;
  }
  return null;
}

Map<String, String> validateMedicalRecordUploadForm({
  required MedicalDocumentTypeEnum? type,
  required String title,
  required String notes,
  required List<Uint8List> files,
  required AppLocalizations l10n,
}) {
  final errors = <String, String>{};
  if (type == null) {
    errors['type'] = l10n.medicalRecordUploadTypeRequired;
  }
  if (files.isEmpty) {
    errors['file'] = l10n.medicalRecordUploadNoFiles;
  }
  if (title.length > medicalRecordMaxTitleLength) {
    errors['title'] = l10n.medicalRecordUploadTitle;
  }
  if (notes.length > medicalRecordMaxNotesLength) {
    errors['notes'] = l10n.medicalRecordUploadNotes;
  }
  return errors;
}
