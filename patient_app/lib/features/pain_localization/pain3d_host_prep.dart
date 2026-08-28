import 'dart:io';

import 'models/pain3d_body.dart';
import 'models/pain3d_download_progress.dart';
import 'pain3d_log.dart';
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
    pain3dLog('prep start body=${body.name}');
    var glb = await store.verifiedFile(body);
    pain3dLog('cache ${glb == null ? 'miss' : 'hit'} path=${glb?.path}');
    if (glb == null) {
      final online = await isOnline();
      pain3dLog('online=$online');
      if (!online) return const Pain3dHostPrepResult.offline();
      await for (final progress in store.ensureBody(body)) {
        onProgress?.call(progress);
        if (progress.phase == Pain3dDownloadPhase.ready) {
          glb = progress.file;
          pain3dLog('download ready path=${glb?.path}');
        }
      }
    }
    if (glb == null || !glb.existsSync()) {
      pain3dLog('prep missing after download exists=${glb?.existsSync()}');
      return const Pain3dHostPrepResult.missing();
    }
    pain3dLog('prep ready path=${glb.path}');
    return Pain3dHostPrepResult.ready(glb);
  }
}
