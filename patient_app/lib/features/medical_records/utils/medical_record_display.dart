import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

/// Filter chip order: All, then each document type per task 8.4.
const medicalRecordTypeFilters = <MedicalDocumentTypeEnum?>[
  null,
  MedicalDocumentTypeEnum.prescription,
  MedicalDocumentTypeEnum.report,
  MedicalDocumentTypeEnum.labResult,
  MedicalDocumentTypeEnum.imaging,
  MedicalDocumentTypeEnum.certificate,
  MedicalDocumentTypeEnum.other,
];

String? medicalDocumentTypeWireName(MedicalDocumentTypeEnum? type) {
  if (type == null) return null;
  if (type == MedicalDocumentTypeEnum.prescription) return 'prescription';
  if (type == MedicalDocumentTypeEnum.report) return 'report';
  if (type == MedicalDocumentTypeEnum.labResult) return 'lab_result';
  if (type == MedicalDocumentTypeEnum.imaging) return 'imaging';
  if (type == MedicalDocumentTypeEnum.certificate) return 'certificate';
  return 'other';
}

String medicalRecordTypeLabel(
  MedicalDocumentTypeEnum? type,
  AppLocalizations l10n,
) {
  if (type == null) return l10n.medicalRecordsFilterAll;
  if (type == MedicalDocumentTypeEnum.prescription) {
    return l10n.medicalRecordTypePrescription;
  }
  if (type == MedicalDocumentTypeEnum.report) {
    return l10n.medicalRecordTypeReport;
  }
  if (type == MedicalDocumentTypeEnum.labResult) {
    return l10n.medicalRecordTypeLabResult;
  }
  if (type == MedicalDocumentTypeEnum.imaging) {
    return l10n.medicalRecordTypeImaging;
  }
  if (type == MedicalDocumentTypeEnum.certificate) {
    return l10n.medicalRecordTypeCertificate;
  }
  return l10n.medicalRecordTypeOther;
}

IconData medicalRecordTypeIcon(MedicalDocumentTypeEnum? type) {
  if (type == MedicalDocumentTypeEnum.prescription) {
    return Icons.medication_outlined;
  }
  if (type == MedicalDocumentTypeEnum.report) {
    return Icons.article_outlined;
  }
  if (type == MedicalDocumentTypeEnum.labResult) {
    return Icons.biotech_outlined;
  }
  if (type == MedicalDocumentTypeEnum.imaging) {
    return Icons.scanner_outlined;
  }
  if (type == MedicalDocumentTypeEnum.certificate) {
    return Icons.verified_outlined;
  }
  if (type == MedicalDocumentTypeEnum.other) {
    return Icons.insert_drive_file_outlined;
  }
  return Icons.folder_outlined;
}

String medicalRecordAuthorRoleLabel(
  MedicalDocumentAuthorRoleEnum? role,
  AppLocalizations l10n,
) {
  if (role == MedicalDocumentAuthorRoleEnum.patient) {
    return l10n.medicalRecordAuthorPatient;
  }
  if (role == MedicalDocumentAuthorRoleEnum.specialist) {
    return l10n.medicalRecordAuthorSpecialist;
  }
  if (role == MedicalDocumentAuthorRoleEnum.concierge) {
    return l10n.medicalRecordAuthorConcierge;
  }
  return '';
}

String formatMedicalRecordDate(DateTime? dateTime, String locale) {
  if (dateTime == null) return '';
  return DateFormat.yMMMd(locale).format(dateTime.toLocal());
}

String formatMedicalRecordFileSize(int? bytes, AppLocalizations l10n) {
  if (bytes == null || bytes < 0) return '';
  if (bytes < 1024) return l10n.medicalRecordFileSizeBytes(bytes);
  if (bytes < 1024 * 1024) {
    final kb = (bytes / 1024).toStringAsFixed(1);
    return l10n.medicalRecordFileSizeKb(kb);
  }
  final mb = (bytes / (1024 * 1024)).toStringAsFixed(1);
  return l10n.medicalRecordFileSizeMb(mb);
}
