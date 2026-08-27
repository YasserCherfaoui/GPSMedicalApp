import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/pain_selection.dart';

/// Local confirmed/working selections. Not the Phase 3.5 vault.
abstract class PainSelectionStore {
  Future<List<PainSelection>> read();
  Future<void> write(List<PainSelection> items);
}

class MemoryPainSelectionStore implements PainSelectionStore {
  List<PainSelection> items = const [];

  @override
  Future<List<PainSelection>> read() async => List.unmodifiable(items);

  @override
  Future<void> write(List<PainSelection> items) async {
    this.items = List.unmodifiable(items);
  }
}

class SecurePainSelectionStore implements PainSelectionStore {
  SecurePainSelectionStore({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
          );

  static const _key = 'pain3d_selections_v1';

  final FlutterSecureStorage _storage;

  @override
  Future<List<PainSelection>> read() async {
    final raw = await _storage.read(key: _key);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final item in decoded)
          if (item is Map)
            PainSelection.fromPersisted(Map<String, dynamic>.from(item)),
      ];
    } on Object {
      return const [];
    }
  }

  @override
  Future<void> write(List<PainSelection> items) async {
    final payload = jsonEncode([for (final item in items) item.toJson()]);
    await _storage.write(key: _key, value: payload);
  }
}
