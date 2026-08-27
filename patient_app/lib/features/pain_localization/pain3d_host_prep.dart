import 'dart:io';

import 'models/pain3d_body.dart';
import 'models/pain3d_download_progress.dart';
import 'services/asset_download_service.dart';

enum Pain3dHostPrepStatus { offline, ready, missing }

class Pain3dHostPrepResult {
  const Pain3dHostPrepResult._(this.status, this.file);

  const Pain3dHostPrepResult.offline()
    : this._(Pain3dHostPrepStatus.offline, null);

  const Pain3dHostPrepResult.ready(File file)
    : this._(Pain3dHostPrepStatus.ready, file);

  const Pain3dHostPrepResult.missing()
    : this._(Pain3dHostPrepStatus.missing, null);

  final Pain3dHostPrepStatus status;
  final File? file;
}

/// Resolves the cached/downloaded GLB before the WebView is created.
class Pain3dHostPrep {
  static Future<Pain3dHostPrepResult> resolve({
    required Pain3dGlbStore store,
    required Future<bool> Function() isOnline,
    required Pain3dBody body,
    void Function(Pain3dDownloadProgress progress)? onProgress,
  }) async {
    var glb = await store.verifiedFile(body);
    if (glb == null) {
      if (!await isOnline()) return const Pain3dHostPrepResult.offline();
      await for (final progress in store.ensureBody(body)) {
        onProgress?.call(progress);
        if (progress.phase == Pain3dDownloadPhase.ready) {
          glb = progress.file;
        }
      }
    }
    if (glb == null || !glb.existsSync()) {
      return const Pain3dHostPrepResult.missing();
    }
    return Pain3dHostPrepResult.ready(glb);
  }
}
