import 'dart:io';

import 'package:flutter/services.dart';

import '../models/pain3d_body.dart';
import '../pain3d_constants.dart';
import '../pain3d_log.dart';

/// Copies bundled viewer files + the cached GLB into one directory so
/// [Pain3dLocalhostServer] can serve them with the viewer's relative paths.
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
    pain3dLog('www copy ${glb.path} → ${dest.path}');
    await glb.copy(dest.path);
    pain3dLog('www ready ${www.path}');
    return www;
  }

  Future<void> _syncBundledAssets() async {
    final stamp = File('${www.path}/.bundle_version');
    final viewer = File('${www.path}/pain_viewer.html');
    if (await stamp.exists() &&
        (await stamp.readAsString()).trim() == pain3dAssetVersion &&
        await viewer.exists()) {
      pain3dLog('www bundle up-to-date (${viewer.path})');
      return;
    }
    pain3dLog('www syncing bundled assets → ${www.path}');
    var copied = 0;
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
      copied++;
    }
    await stamp.writeAsString(pain3dAssetVersion, flush: true);
    pain3dLog('www synced $copied files');
    if (!await viewer.exists()) {
      throw StateError('pain_viewer.html missing after www sync');
    }
  }
}
