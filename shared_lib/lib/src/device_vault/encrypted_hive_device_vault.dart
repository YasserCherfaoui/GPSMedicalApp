import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:hive_ce/hive.dart';
import 'package:path/path.dart' as p;

import 'device_vault.dart';
import 'restricted_profile_fields.dart';
import 'vault_key_store.dart';
import 'vaulted_medical_document.dart';

const _boxName = 'gps_device_vault_v1';

/// Hive-backed vault: AES box cipher + AES-GCM files under [root].
class EncryptedHiveDeviceVault implements DeviceVault {
  EncryptedHiveDeviceVault._(this._root, this._box, this._key);

  final Directory _root;
  final Box<String> _box;
  final Uint8List _key;

  static Future<EncryptedHiveDeviceVault> open({
    required Directory root,
    required VaultKeyStore keys,
  }) async {
    await root.create(recursive: true);
    final hiveDir = Directory(p.join(root.path, 'hive'));
    await hiveDir.create(recursive: true);
    Hive.init(hiveDir.path);
    final key = await keys.readOrCreate();
    if (key.length != 32) {
      throw StateError('Device vault AES key must be 32 bytes');
    }
    final box = await Hive.openBox<String>(
      _boxName,
      encryptionCipher: HiveAesCipher(key),
    );
    return EncryptedHiveDeviceVault._(root, box, key);
  }

  Future<void> close() async {
    if (_box.isOpen) {
      await _box.close();
    }
  }

  @override
  Future<RestrictedProfileFields?> loadRestrictedProfile(String userId) async {
    final raw = _box.get(_profileKey(userId));
    if (raw == null || raw.isEmpty) return null;
    final json = jsonDecode(raw);
    if (json is! Map) return null;
    return RestrictedProfileFields.fromJson(Map<String, dynamic>.from(json));
  }

  @override
  Future<void> saveRestrictedProfile(
    String userId,
    RestrictedProfileFields fields,
  ) async {
    await _box.put(_profileKey(userId), jsonEncode(fields.toJson()));
  }

  @override
  Future<List<VaultedMedicalDocument>> listDocuments(String userId) async {
    final docs = _readDocs(userId);
    docs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return docs;
  }

  @override
  Future<void> saveDocument({
    required String userId,
    required VaultedMedicalDocument meta,
    required Uint8List bytes,
  }) async {
    final docs = _readDocs(userId);
    docs.removeWhere((d) => d.id == meta.id);
    docs.add(meta);
    await _writeDocs(userId, docs);
    final file = await _documentFile(userId, meta.id);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(await _encrypt(bytes), flush: true);
  }

  @override
  Future<VaultedMedicalDocument?> loadDocumentMeta(
    String userId,
    String documentId,
  ) async {
    for (final doc in _readDocs(userId)) {
      if (doc.id == documentId) return doc;
    }
    return null;
  }

  @override
  Future<Uint8List?> loadDocumentBytes(String userId, String documentId) async {
    final file = await _documentFile(userId, documentId);
    if (!file.existsSync()) return null;
    final encrypted = await file.readAsBytes();
    final clear = await _decrypt(encrypted);
    return Uint8List.fromList(clear);
  }

  @override
  Future<void> deleteDocument(String userId, String documentId) async {
    final docs = _readDocs(userId)..removeWhere((d) => d.id == documentId);
    await _writeDocs(userId, docs);
    final file = await _documentFile(userId, documentId);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  Future<bool> isWarningAcknowledged(String userId) async {
    return _box.get(_warnKey(userId)) == '1';
  }

  @override
  Future<void> acknowledgeWarning(String userId) async {
    await _box.put(_warnKey(userId), '1');
  }

  @override
  Future<void> wipeUser(String userId) async {
    await _box.delete(_profileKey(userId));
    await _box.delete(_docsKey(userId));
    await _box.delete(_warnKey(userId));
    final dir = Directory(p.join(_root.path, 'files', userId));
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }

  List<VaultedMedicalDocument> _readDocs(String userId) {
    final raw = _box.get(_docsKey(userId));
    if (raw == null || raw.isEmpty) return [];
    final decoded = jsonDecode(raw);
    if (decoded is! List) return [];
    return [
      for (final item in decoded)
        if (item is Map)
          VaultedMedicalDocument.fromJson(Map<String, dynamic>.from(item)),
    ];
  }

  Future<void> _writeDocs(
    String userId,
    List<VaultedMedicalDocument> docs,
  ) async {
    await _box.put(
      _docsKey(userId),
      jsonEncode([for (final doc in docs) doc.toJson()]),
    );
  }

  Future<File> _documentFile(String userId, String documentId) async {
    return File(p.join(_root.path, 'files', userId, '$documentId.enc'));
  }

  Future<Uint8List> _encrypt(Uint8List clear) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKeyFromBytes(_key);
    final secretBox = await algorithm.encrypt(
      clear,
      secretKey: secretKey,
      nonce: algorithm.newNonce(),
    );
    return Uint8List.fromList(secretBox.concatenation());
  }

  Future<List<int>> _decrypt(Uint8List combined) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKeyFromBytes(_key);
    final secretBox = SecretBox.fromConcatenation(
      combined,
      nonceLength: 12,
      macLength: 16,
    );
    return algorithm.decrypt(secretBox, secretKey: secretKey);
  }

  String _profileKey(String userId) => 'profile:$userId';
  String _docsKey(String userId) => 'docs:$userId';
  String _warnKey(String userId) => 'warn:$userId';
}
