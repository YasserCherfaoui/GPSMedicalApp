import 'package:shared_preferences/shared_preferences.dart';

import '../models/pain3d_body.dart';

/// Remembers the last explicit body choice. Never reads profile data.
class Pain3dBodyStore {
  Pain3dBodyStore({SharedPreferences? prefs}) : _prefsOverride = prefs;

  static const _key = 'pain3d_last_body';

  final SharedPreferences? _prefsOverride;

  Future<SharedPreferences> get _prefs async =>
      _prefsOverride ?? SharedPreferences.getInstance();

  Future<Pain3dBody?> read() async {
    final raw = (await _prefs).getString(_key);
    return switch (raw) {
      'male' => Pain3dBody.male,
      'female' => Pain3dBody.female,
      _ => null,
    };
  }

  Future<void> write(Pain3dBody body) async {
    await (await _prefs).setString(_key, body.name);
  }
}
