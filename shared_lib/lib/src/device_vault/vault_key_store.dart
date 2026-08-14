import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Supplies the 32-byte AES key used by the device vault.
abstract class VaultKeyStore {
  Future<Uint8List> readOrCreate();
}

/// Fixed key for unit tests (no platform plugin).
class MemoryVaultKeyStore implements VaultKeyStore {
  MemoryVaultKeyStore([Uint8List? key])
    : _key = key ?? Uint8List.fromList(List<int>.generate(32, (i) => i + 1));

  final Uint8List _key;

  @override
  Future<Uint8List> readOrCreate() async => Uint8List.fromList(_key);
}

/// AES-256 key held in [FlutterSecureStorage].
class SecureStorageVaultKeyStore implements VaultKeyStore {
  SecureStorageVaultKeyStore({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
          );

  static const keyName = 'gps_device_vault_aes_key_v1';

  final FlutterSecureStorage _storage;

  @override
  Future<Uint8List> readOrCreate() async {
    final existing = await _storage.read(key: keyName);
    if (existing != null && existing.isNotEmpty) {
      return Uint8List.fromList(base64Decode(existing));
    }
    final key = _randomKey();
    await _storage.write(key: keyName, value: base64Encode(key));
    return key;
  }

  Uint8List _randomKey() {
    final rand = Random.secure();
    return Uint8List.fromList(List<int>.generate(32, (_) => rand.nextInt(256)));
  }
}
