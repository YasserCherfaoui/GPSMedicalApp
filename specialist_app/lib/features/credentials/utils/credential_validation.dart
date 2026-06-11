import 'dart:typed_data';

import 'package:gps_medical_shared/gps_medical_shared.dart';

/// OpenAPI limit for `POST /doctors/me/credentials` (10 MiB).
const credentialMaxFileBytes = 10 * 1024 * 1024;
const credentialMaxFilesPerSession = 5;

const credentialAllowedMimeTypes = {
  'application/pdf',
  'image/jpeg',
  'image/png',
};

String? detectCredentialMimeType(Uint8List bytes) {
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

String? validateCredentialFileBytes({
  required Uint8List bytes,
  required AppLocalizations l10n,
}) {
  if (bytes.length > credentialMaxFileBytes) {
    return l10n.medicalRecordUploadFileTooLarge;
  }
  final mime = detectCredentialMimeType(bytes);
  if (mime == null || !credentialAllowedMimeTypes.contains(mime)) {
    return l10n.medicalRecordUploadInvalidMime;
  }
  return null;
}

String credentialTypeWireName(CredentialTypeEnum type) {
  return switch (type) {
    CredentialTypeEnum.diploma => 'diploma',
    CredentialTypeEnum.councilCard => 'council_card',
    CredentialTypeEnum.specialtyCert => 'specialty_cert',
    CredentialTypeEnum.other => 'other',
    _ => 'other',
  };
}
