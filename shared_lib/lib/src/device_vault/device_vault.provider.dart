import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'device_vault.dart';
import 'memory_device_vault.dart';

/// Defaults to an in-memory vault so widget tests need no Hive or plugins.
/// Production overrides this with [EncryptedHiveDeviceVault] in `main.dart`.
final deviceVaultProvider = Provider<DeviceVault>((ref) {
  return MemoryDeviceVault();
});
