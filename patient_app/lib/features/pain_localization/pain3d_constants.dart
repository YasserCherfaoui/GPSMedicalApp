/// Pinned asset pack version. Selects the R2 path and the on-disk cache dir.
const pain3dAssetVersion = '1.1.0';

/// Bump when bundled viewer assets change so [Pain3dWwwRoot] re-syncs www.
const pain3dViewerBundleRevision = '4';

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
  return Uri.parse('$origin/pain3d/v$pain3dAssetVersion/assets_manifest.json');
}

Uri pain3dGlbUri(String fileName, {String? baseUrl}) {
  final origin = baseUrl ?? pain3dAssetsBaseUrl();
  return Uri.parse('$origin/pain3d/v$pain3dAssetVersion/$fileName');
}

/// Viewer JS only has `fr` | `ar`. Tamazight uses French in the WebView.
String pain3dViewerLanguageCode(String languageCode) {
  return languageCode == 'ar' ? 'ar' : 'fr';
}

/// Compile-time flag (`--dart-define=PAIN_LOCALIZATION=true`). Default **off**.
bool painLocalizationEnabledFromEnv() {
  const raw = String.fromEnvironment(
    'PAIN_LOCALIZATION',
    defaultValue: 'false',
  );
  return raw == 'true' || raw == '1';
}
