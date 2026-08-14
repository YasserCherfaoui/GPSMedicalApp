import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:gps_medical_shared/src/device_vault/encrypted_hive_device_vault.dart';
import 'package:gps_medical_shared/src/device_vault/memory_device_vault.dart';
import 'package:gps_medical_shared/src/device_vault/restricted_profile_fields.dart';
import 'package:gps_medical_shared/src/device_vault/vault_key_store.dart';
import 'package:gps_medical_shared/src/device_vault/vaulted_medical_document.dart';
import 'package:hive_ce/hive.dart';

void main() {
  test('MemoryDeviceVault persists profile, files, and warning ack', () async {
    final vault = MemoryDeviceVault();
    const userId = 'pat-1';

    await vault.saveRestrictedProfile(
      userId,
      RestrictedProfileFields(birthDate: Date(1990, 5, 12)),
    );
    await vault.acknowledgeWarning(userId);
    final meta = VaultedMedicalDocument(
      id: 'doc-1',
      type: MedicalDocumentTypeEnum.report,
      patientId: userId,
      authorId: userId,
      fileSize: 4,
      mimeType: 'application/pdf',
      createdAt: DateTime.utc(2026, 8, 14),
      title: 'Compte-rendu',
    );
    await vault.saveDocument(
      userId: userId,
      meta: meta,
      bytes: Uint8List.fromList([1, 2, 3, 4]),
    );

    expect(
      (await vault.loadRestrictedProfile(userId))?.birthDate,
      Date(1990, 5, 12),
    );
    expect(await vault.isWarningAcknowledged(userId), isTrue);
    expect(await vault.loadDocumentBytes(userId, 'doc-1'), [1, 2, 3, 4]);
    expect((await vault.listDocuments(userId)).single.title, 'Compte-rendu');

    await vault.wipeUser(userId);
    expect(await vault.loadRestrictedProfile(userId), isNull);
    expect(await vault.listDocuments(userId), isEmpty);
  });

  test('EncryptedHiveDeviceVault survives close and reopen', () async {
    final root = await Directory.systemTemp.createTemp('gps_vault_');
    addTearDown(() async {
      if (Hive.isBoxOpen('gps_device_vault_v1')) {
        await Hive.box<String>('gps_device_vault_v1').close();
      }
      if (root.existsSync()) {
        await root.delete(recursive: true);
      }
    });

    final keys = MemoryVaultKeyStore();
    final first = await EncryptedHiveDeviceVault.open(root: root, keys: keys);
    await first.saveRestrictedProfile(
      'pat-1',
      RestrictedProfileFields(
        birthDate: Date(1991, 1, 2),
        gender: PatientGenderEnum.female,
      ),
    );
    await first.saveDocument(
      userId: 'pat-1',
      meta: VaultedMedicalDocument(
        id: 'doc-local',
        type: MedicalDocumentTypeEnum.labResult,
        patientId: 'pat-1',
        authorId: 'pat-1',
        fileSize: 3,
        mimeType: 'image/jpeg',
        createdAt: DateTime.utc(2026, 8, 1),
      ),
      bytes: Uint8List.fromList([9, 8, 7]),
    );
    await first.acknowledgeWarning('pat-1');
    await first.close();

    final second = await EncryptedHiveDeviceVault.open(root: root, keys: keys);
    final profile = await second.loadRestrictedProfile('pat-1');
    expect(profile?.birthDate, Date(1991, 1, 2));
    expect(profile?.gender, PatientGenderEnum.female);
    expect(await second.isWarningAcknowledged('pat-1'), isTrue);
    expect(await second.loadDocumentBytes('pat-1', 'doc-local'), [9, 8, 7]);
    await second.close();
  });

  test('allowedServerPatientUpdate drops restricted keys', () {
    final stripped = allowedServerPatientUpdate(
      PatientUpdate(
        (b) => b
          ..fullName = 'Amina'
          ..email = 'a@example.dz'
          ..birthDate = Date(1990, 5, 12)
          ..gender = PatientUpdateGenderEnum.female
          ..bloodType = PatientUpdateBloodTypeEnum.oPlus,
      ),
    );
    expect(stripped.fullName, 'Amina');
    expect(stripped.email, 'a@example.dz');
    expect(stripped.birthDate, isNull);
    expect(stripped.gender, isNull);
    expect(stripped.bloodType, isNull);
  });
}
