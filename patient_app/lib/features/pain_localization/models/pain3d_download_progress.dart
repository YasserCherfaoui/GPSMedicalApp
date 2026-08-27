import 'dart:io';

enum Pain3dDownloadPhase { fetchingManifest, downloading, verifying, ready }

class Pain3dDownloadProgress {
  const Pain3dDownloadProgress({
    required this.phase,
    this.receivedBytes,
    this.totalBytes,
    this.file,
  });

  const Pain3dDownloadProgress.fetchingManifest()
    : this(phase: Pain3dDownloadPhase.fetchingManifest);

  const Pain3dDownloadProgress.verifying()
    : this(phase: Pain3dDownloadPhase.verifying);

  Pain3dDownloadProgress.ready(File file, int totalBytes)
    : this(
        phase: Pain3dDownloadPhase.ready,
        receivedBytes: totalBytes,
        totalBytes: totalBytes,
        file: file,
      );

  final Pain3dDownloadPhase phase;
  final int? receivedBytes;
  final int? totalBytes;
  final File? file;

  double? get fraction {
    final received = receivedBytes;
    final total = totalBytes;
    if (received == null || total == null || total <= 0) return null;
    return (received / total).clamp(0.0, 1.0);
  }
}
