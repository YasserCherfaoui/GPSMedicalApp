import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/medical_records/utils/medical_record_validation.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('fr'));
  });

  test('detectMedicalRecordMimeType recognises PDF JPEG and PNG', () {
    expect(
      detectMedicalRecordMimeType(Uint8List.fromList([0x25, 0x50, 0x44, 0x46])),
      'application/pdf',
    );
    expect(
      detectMedicalRecordMimeType(Uint8List.fromList([0xFF, 0xD8, 0xFF, 0x00])),
      'image/jpeg',
    );
    expect(
      detectMedicalRecordMimeType(
        Uint8List.fromList([
          0x89,
          0x50,
          0x4E,
          0x47,
          0x0D,
          0x0A,
          0x1A,
          0x0A,
        ]),
      ),
      'image/png',
    );
  });

  test('validateMedicalRecordFileBytes rejects oversize file', () {
    final bytes = Uint8List(medicalRecordMaxFileBytes + 1);
    expect(
      validateMedicalRecordFileBytes(bytes: bytes, l10n: l10n),
      l10n.medicalRecordUploadFileTooLarge,
    );
  });

  test('validateMedicalRecordFileBytes rejects invalid MIME', () {
    final bytes = Uint8List.fromList([0x00, 0x01, 0x02, 0x03]);
    expect(
      validateMedicalRecordFileBytes(bytes: bytes, l10n: l10n),
      l10n.medicalRecordUploadInvalidMime,
    );
  });

  test('validateMedicalRecordUploadForm requires type and files', () {
    final errors = validateMedicalRecordUploadForm(
      type: null,
      title: '',
      notes: '',
      files: [],
      l10n: l10n,
    );
    expect(errors['type'], l10n.medicalRecordUploadTypeRequired);
    expect(errors['file'], l10n.medicalRecordUploadNoFiles);
  });
}
