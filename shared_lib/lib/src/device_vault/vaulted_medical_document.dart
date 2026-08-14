import 'dart:math';

import 'package:gps_medical_api/gps_medical_api.dart';

/// On-device medical-record metadata (file bytes live next to the Hive box).
class VaultedMedicalDocument {
  const VaultedMedicalDocument({
    required this.id,
    required this.type,
    required this.patientId,
    required this.authorId,
    required this.fileSize,
    required this.mimeType,
    required this.createdAt,
    this.title,
    this.notes,
    this.appointmentId,
    this.fileName,
  });

  final String id;
  final MedicalDocumentTypeEnum type;
  final String patientId;
  final String authorId;
  final int fileSize;
  final String mimeType;
  final DateTime createdAt;
  final String? title;
  final String? notes;
  final String? appointmentId;
  final String? fileName;

  MedicalDocument toMedicalDocument() {
    return MedicalDocument((b) {
      b
        ..id = id
        ..type = type
        ..title = title
        ..notes = notes
        ..appointmentId = appointmentId
        ..patientId = patientId
        ..authorId = authorId
        ..authorRole = MedicalDocumentAuthorRoleEnum.patient
        ..fileSize = fileSize
        ..mimeType = mimeType
        ..createdAt = createdAt.toUtc();
    });
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'type': type.name,
      'patient_id': patientId,
      'author_id': authorId,
      'file_size': fileSize,
      'mime_type': mimeType,
      'created_at': createdAt.toUtc().toIso8601String(),
      if (title != null) 'title': title,
      if (notes != null) 'notes': notes,
      if (appointmentId != null) 'appointment_id': appointmentId,
      if (fileName != null) 'file_name': fileName,
    };
  }

  factory VaultedMedicalDocument.fromJson(Map<String, dynamic> json) {
    return VaultedMedicalDocument(
      id: json['id'] as String,
      type: MedicalDocumentTypeEnum.valueOf(json['type'] as String),
      patientId: json['patient_id'] as String,
      authorId: json['author_id'] as String,
      fileSize: json['file_size'] as int,
      mimeType: json['mime_type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String).toUtc(),
      title: json['title'] as String?,
      notes: json['notes'] as String?,
      appointmentId: json['appointment_id'] as String?,
      fileName: json['file_name'] as String?,
    );
  }
}

String newDeviceVaultId() {
  final rand = Random.secure();
  final bytes = List<int>.generate(16, (_) => rand.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  String hex(int i) => bytes[i].toRadixString(16).padLeft(2, '0');
  return '${hex(0)}${hex(1)}${hex(2)}${hex(3)}-'
      '${hex(4)}${hex(5)}-${hex(6)}${hex(7)}-'
      '${hex(8)}${hex(9)}-'
      '${hex(10)}${hex(11)}${hex(12)}${hex(13)}${hex(14)}${hex(15)}';
}
