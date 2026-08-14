import 'dart:typed_data';

import 'restricted_profile_fields.dart';
import 'vaulted_medical_document.dart';

/// Encrypted on-device store for `device_only` (DZ) restricted patient data.
abstract class DeviceVault {
  Future<RestrictedProfileFields?> loadRestrictedProfile(String userId);

  Future<void> saveRestrictedProfile(
    String userId,
    RestrictedProfileFields fields,
  );

  Future<List<VaultedMedicalDocument>> listDocuments(String userId);

  Future<void> saveDocument({
    required String userId,
    required VaultedMedicalDocument meta,
    required Uint8List bytes,
  });

  Future<VaultedMedicalDocument?> loadDocumentMeta(
    String userId,
    String documentId,
  );

  Future<Uint8List?> loadDocumentBytes(String userId, String documentId);

  Future<void> deleteDocument(String userId, String documentId);

  Future<bool> isWarningAcknowledged(String userId);

  Future<void> acknowledgeWarning(String userId);

  Future<void> wipeUser(String userId);
}
