import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/credentials/utils/credential_validation.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('fr'));
  });

  test('detectCredentialMimeType detects pdf jpeg png', () {
    expect(
      detectCredentialMimeType(Uint8List.fromList([0x25, 0x50, 0x44, 0x46])),
      'application/pdf',
    );
    expect(
      detectCredentialMimeType(Uint8List.fromList([0xFF, 0xD8, 0xFF, 0x00])),
      'image/jpeg',
    );
    expect(
      detectCredentialMimeType(
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
    expect(detectCredentialMimeType(Uint8List.fromList([0x00])), isNull);
  });

  test('validateCredentialFileBytes rejects oversized and invalid', () {
    final ok = Uint8List.fromList([0x25, 0x50, 0x44, 0x46, 0x2D]);
    expect(validateCredentialFileBytes(bytes: ok, l10n: l10n), isNull);

    final bad = Uint8List.fromList([0x00, 0x01]);
    expect(validateCredentialFileBytes(bytes: bad, l10n: l10n), isNotNull);

    final huge = Uint8List(credentialMaxFileBytes + 1);
    huge[0] = 0x25;
    huge[1] = 0x50;
    huge[2] = 0x44;
    huge[3] = 0x46;
    expect(validateCredentialFileBytes(bytes: huge, l10n: l10n), isNotNull);
  });

  test('credentialTypeWireName maps enums', () {
    expect(credentialTypeWireName(CredentialTypeEnum.diploma), 'diploma');
    expect(
      credentialTypeWireName(CredentialTypeEnum.councilCard),
      'council_card',
    );
    expect(
      credentialTypeWireName(CredentialTypeEnum.specialtyCert),
      'specialty_cert',
    );
    expect(credentialTypeWireName(CredentialTypeEnum.other), 'other');
  });
}
