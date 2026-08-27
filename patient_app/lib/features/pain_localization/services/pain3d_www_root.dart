import 'dart:io';

import 'package:flutter/services.dart';

import '../models/pain3d_body.dart';
import '../pain3d_constants.dart';

/// Copies bundled viewer files + the cached GLB into one directory so
/// [InAppLocalhostServer] can serve them with the viewer's relative paths.
class Pain3dWwwRoot {
  Pain3dWwwRoot({required this.supportDir, AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  static const _assetPrefix = 'assets/pain3d/';

  final Directory supportDir;
  final AssetBundle _bundle;

  Directory get www => Directory('${supportDir.path}/pain3d/www');

  Future<Directory> prepare({
    required File glb,
    required Pain3dBody body,
  }) async {
    await www.create(recursive: true);
    await _syncBundledAssets();
    final dest = File('${www.path}/${body.glbFileName}');
    await glb.copy(dest.path);
    return www;
  }

  Future<void> _syncBundledAssets() async {
    final stamp = File('${www.path}/.bundle_version');
    if (await stamp.exists() &&
        (await stamp.readAsString()).trim() == pain3dAssetVersion) {
      return;
    }
    final manifest = await AssetManifest.loadFromAssetBundle(_bundle);
    for (final key in manifest.listAssets()) {
      if (!key.startsWith(_assetPrefix)) continue;
      if (key.endsWith('.glb')) continue;
      final rel = key.substring(_assetPrefix.length);
      if (rel.isEmpty) continue;
      final out = File('${www.path}/$rel');
      await out.parent.create(recursive: true);
      final data = await _bundle.load(key);
      await out.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        flush: true,
      );
    }
    await stamp.writeAsString(pain3dAssetVersion, flush: true);
  }
}
