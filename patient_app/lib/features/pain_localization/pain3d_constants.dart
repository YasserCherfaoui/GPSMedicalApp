/// Pinned asset pack version. Selects the R2 path and the on-disk cache dir.
const pain3dAssetVersion = '1.1.0';

/// Default public origin (custom domain on the `gpsmedical-assets` R2 bucket).
const pain3dAssetsBaseUrlDefault = 'https://assets.medora-corporate.com';

/// Flavor override via `--dart-define-from-file=config/{flavor}.json`.
String pain3dAssetsBaseUrl() {
  const fromEnv = String.fromEnvironment('PAIN3D_ASSETS_BASE_URL');
  final raw = fromEnv.isEmpty ? pain3dAssetsBaseUrlDefault : fromEnv;
  return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
}

Uri pain3dManifestUri({String? baseUrl}) {
  final origin = baseUrl ?? pain3dAssetsBaseUrl();
  return Uri.parse('$origin/pain3d/$pain3dAssetVersion/assets_manifest.json');
}

Uri pain3dGlbUri(String fileName, {String? baseUrl}) {
  final origin = baseUrl ?? pain3dAssetsBaseUrl();
  return Uri.parse('$origin/pain3d/$pain3dAssetVersion/$fileName');
}
