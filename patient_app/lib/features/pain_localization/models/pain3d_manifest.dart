import 'pain3d_body.dart';

class Pain3dManifestFile {
  const Pain3dManifestFile({required this.sha256, required this.bytes});

  final String sha256;
  final int bytes;
}

class Pain3dManifest {
  const Pain3dManifest({
    required this.version,
    required this.basePath,
    required this.files,
  });

  final String version;
  final String basePath;
  final Map<String, Pain3dManifestFile> files;

  factory Pain3dManifest.fromJson(Map<String, dynamic> json) {
    final version = json['version'];
    final basePath = json['base_path'];
    final filesRaw = json['files'];
    if (version is! String || version.isEmpty) {
      throw const FormatException('assets_manifest.json: missing version');
    }
    if (basePath is! String) {
      throw const FormatException('assets_manifest.json: missing base_path');
    }
    if (filesRaw is! Map<String, dynamic>) {
      throw const FormatException('assets_manifest.json: missing files');
    }
    final files = <String, Pain3dManifestFile>{};
    for (final entry in filesRaw.entries) {
      final value = entry.value;
      if (value is! Map<String, dynamic>) {
        throw FormatException(
          'assets_manifest.json: invalid file entry ${entry.key}',
        );
      }
      final sha = value['sha256'];
      final bytes = value['bytes'];
      if (sha is! String || sha.isEmpty || bytes is! int || bytes <= 0) {
        throw FormatException(
          'assets_manifest.json: invalid sha256/bytes for ${entry.key}',
        );
      }
      files[entry.key] = Pain3dManifestFile(
        sha256: sha.toLowerCase(),
        bytes: bytes,
      );
    }
    return Pain3dManifest(version: version, basePath: basePath, files: files);
  }

  Pain3dManifestFile fileFor(Pain3dBody body) {
    final name = body.glbFileName;
    final file = files[name];
    if (file == null) {
      throw FormatException('assets_manifest.json: missing $name');
    }
    return file;
  }
}
