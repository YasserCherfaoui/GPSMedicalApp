import 'dart:typed_data';

import 'device_vault.dart';
import 'restricted_profile_fields.dart';
import 'vaulted_medical_document.dart';

/// In-memory vault for tests and the default [deviceVaultProvider].
class MemoryDeviceVault implements DeviceVault {
  final Map<String, RestrictedProfileFields> _profiles = {};
  final Map<String, List<VaultedMedicalDocument>> _docs = {};
  final Map<String, Uint8List> _files = {};
  final Set<String> _warnings = {};

  @override
  Future<RestrictedProfileFields?> loadRestrictedProfile(String userId) async {
    return _profiles[userId];
  }

  @override
  Future<void> saveRestrictedProfile(
    String userId,
    RestrictedProfileFields fields,
  ) async {
    _profiles[userId] = fields;
  }

  @override
  Future<List<VaultedMedicalDocument>> listDocuments(String userId) async {
    final docs = [...?_docs[userId]];
    docs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return docs;
  }

  @override
  Future<void> saveDocument({
    required String userId,
    required VaultedMedicalDocument meta,
    required Uint8List bytes,
  }) async {
    final current = [...?_docs[userId]];
    current.removeWhere((d) => d.id == meta.id);
    current.add(meta);
    _docs[userId] = current;
    _files[_fileKey(userId, meta.id)] = Uint8List.fromList(bytes);
  }

  @override
  Future<VaultedMedicalDocument?> loadDocumentMeta(
    String userId,
    String documentId,
  ) async {
    final docs = _docs[userId];
    if (docs == null) return null;
    for (final doc in docs) {
      if (doc.id == documentId) return doc;
    }
    return null;
  }

  @override
  Future<Uint8List?> loadDocumentBytes(String userId, String documentId) async {
    final bytes = _files[_fileKey(userId, documentId)];
    return bytes == null ? null : Uint8List.fromList(bytes);
  }

  @override
  Future<void> deleteDocument(String userId, String documentId) async {
    final current = _docs[userId];
    if (current != null) {
      current.removeWhere((d) => d.id == documentId);
    }
    _files.remove(_fileKey(userId, documentId));
  }

  @override
  Future<bool> isWarningAcknowledged(String userId) async {
    return _warnings.contains(userId);
  }

  @override
  Future<void> acknowledgeWarning(String userId) async {
    _warnings.add(userId);
  }

  @override
  Future<void> wipeUser(String userId) async {
    _profiles.remove(userId);
    _docs.remove(userId);
    _warnings.remove(userId);
    _files.removeWhere((key, _) => key.startsWith('$userId/'));
  }

  String _fileKey(String userId, String documentId) => '$userId/$documentId';
}
