import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/medical_records/utils/medical_record_download.dart';

void main() {
  test('parseSignedMedicalRecordDownload extracts exp and token', () {
    final response = MedicalRecordsDocumentIdDownloadGet200Response(
      (b) => b
        ..url =
            '/v1/medical-records/doc-1/file?exp=1710000000&token=abc123'
        ..expiresAt = DateTime.parse('2026-06-01T10:05:00Z'),
    );

    final link = parseSignedMedicalRecordDownload(response);

    expect(link.exp, 1710000000);
    expect(link.token, 'abc123');
    expect(link.expiresAt, isNotNull);
  });

  test('isMedicalRecordImageMime and isMedicalRecordPdfMime', () {
    expect(isMedicalRecordImageMime('image/png'), isTrue);
    expect(isMedicalRecordImageMime('image/jpeg'), isTrue);
    expect(isMedicalRecordPdfMime('application/pdf'), isTrue);
    expect(isMedicalRecordImageMime('application/pdf'), isFalse);
  });

  test('isSignedMedicalRecordLinkExpired detects past expires_at', () {
    expect(
      isSignedMedicalRecordLinkExpired(DateTime.parse('2020-01-01T00:00:00Z')),
      isTrue,
    );
    expect(
      isSignedMedicalRecordLinkExpired(DateTime.parse('2099-01-01T00:00:00Z')),
      isFalse,
    );
  });

  test('medicalRecordDownloadFileName uses title and extension', () {
    final document = MedicalDocument(
      (b) => b
        ..id = 'doc-1'
        ..title = 'Ordonnance'
        ..mimeType = 'application/pdf',
    );

    expect(medicalRecordDownloadFileName(document), 'Ordonnance.pdf');
  });
}
