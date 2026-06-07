import 'package:gps_medical_shared/gps_medical_shared.dart';

class SignedMedicalRecordFileLink {
  const SignedMedicalRecordFileLink({
    required this.exp,
    required this.token,
    required this.expiresAt,
  });

  final int exp;
  final String token;
  final DateTime? expiresAt;
}

SignedMedicalRecordFileLink parseSignedMedicalRecordDownload(
  MedicalRecordsDocumentIdDownloadGet200Response response,
) {
  final url = response.url;
  if (url == null || url.isEmpty) {
    throw const FormatException('Missing download url');
  }
  final uri = url.startsWith('http')
      ? Uri.parse(url)
      : Uri.parse('https://api.gpsmedical.dz$url');
  final expRaw = uri.queryParameters['exp'];
  final token = uri.queryParameters['token'];
  if (expRaw == null || token == null || token.isEmpty) {
    throw const FormatException('Missing signed download parameters');
  }
  return SignedMedicalRecordFileLink(
    exp: int.parse(expRaw),
    token: token,
    expiresAt: response.expiresAt,
  );
}

bool isSignedMedicalRecordLinkExpired(DateTime? expiresAt) {
  if (expiresAt == null) return false;
  return DateTime.now().toUtc().isAfter(expiresAt.toUtc());
}

bool isMedicalRecordImageMime(String? mimeType) {
  final mime = mimeType?.toLowerCase() ?? '';
  return mime == 'image/jpeg' || mime == 'image/png';
}

bool isMedicalRecordPdfMime(String? mimeType) {
  return mimeType?.toLowerCase() == 'application/pdf';
}

String medicalRecordFileExtension(String? mimeType) {
  final mime = mimeType?.toLowerCase() ?? '';
  if (mime == 'application/pdf') return '.pdf';
  if (mime == 'image/jpeg') return '.jpg';
  if (mime == 'image/png') return '.png';
  return '';
}

String medicalRecordDownloadFileName(MedicalDocument document) {
  final ext = medicalRecordFileExtension(document.mimeType);
  final title = document.title?.trim();
  final base = (title != null && title.isNotEmpty)
      ? title
      : (document.id ?? 'document');
  if (ext.isNotEmpty && base.toLowerCase().endsWith(ext)) {
    return base;
  }
  return '$base$ext';
}
