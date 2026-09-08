#!/usr/bin/env bash
# Registers Android/iOS apps in Firebase project gps-medical-dev and downloads config.
# Requires: firebase CLI (logged in) + dart pub global activate flutterfire_cli
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! command -v flutterfire >/dev/null 2>&1; then
  echo "Installing flutterfire_cli..."
  dart pub global activate flutterfire_cli
fi

if ! firebase projects:list --json >/dev/null 2>&1; then
  echo "Firebase CLI is not authenticated. Run:"
  echo "  firebase login --reauth"
  exit 1
fi

PROJECT=gps-medical-dev
# Canonical apps used by lib/firebase_options.dart (Debug-dev Android + default iOS plist).
ANDROID_DEV_APP_ID="1:647636807219:android:35b41f6682c4a20d393d46"
ANDROID_BASE_APP_ID="1:647636807219:android:04c529f9860f1897393d46"
IOS_APP_ID="1:647636807219:ios:7c6393de3a22b4ad393d46"

# Soft-deleted apps still reserve package/bundle IDs; undelete before configure.
undelete_app() {
  local kind="$1"
  local app_id="$2"
  python3 - "$kind" "$app_id" "$PROJECT" <<'PY' || true
import json, sys, urllib.request
from pathlib import Path

kind, app_id, project = sys.argv[1:4]
cfg = Path.home() / ".config/configstore/firebase-tools.json"
token = json.loads(cfg.read_text())["tokens"]["access_token"]
url = (
    f"https://firebase.googleapis.com/v1beta1/projects/{project}/"
    f"{kind}/{app_id}"
)
req = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
try:
    with urllib.request.urlopen(req) as resp:
        app = json.loads(resp.read())
except Exception as exc:
    print(f"warn: could not fetch {app_id}: {exc}", file=sys.stderr)
    sys.exit(0)
if app.get("state") != "DELETED":
    sys.exit(0)
req = urllib.request.Request(
    url + ":undelete",
    data=b"{}",
    method="POST",
    headers={
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
    },
)
with urllib.request.urlopen(req) as resp:
    print(f"undeleted {kind} {app_id} -> {resp.status}")
PY
}

echo "Ensuring patient Firebase apps are ACTIVE in $PROJECT..."
undelete_app androidApps "$ANDROID_DEV_APP_ID"
undelete_app androidApps "$ANDROID_BASE_APP_ID"
undelete_app iosApps "$IOS_APP_ID"

echo "Configuring FlutterFire for patient_app (project $PROJECT)..."
# iOS uses com.gpsmedical.patientApp (matches GoogleService-Info + firebase_options).
# Android flavor uses com.gpsmedical.patient_app.dev.
flutterfire configure \
  --project="$PROJECT" \
  --yes \
  --overwrite-firebase-options \
  --platforms=android,ios \
  --ios-bundle-id=com.gpsmedical.patientApp \
  --ios-build-config=Debug-dev \
  --android-package-name=com.gpsmedical.patient_app.dev \
  --android-out=android/app/src/dev \
  --ios-out=ios/Runner

# Keep google-services.json patient-only (flutterfire may include sibling apps).
python3 - "$ANDROID_DEV_APP_ID" "$ANDROID_BASE_APP_ID" "$PROJECT" <<'PY'
import json, subprocess, sys
from pathlib import Path

dev_id, base_id, project = sys.argv[1:4]
wanted = {
    "com.gpsmedical.patient_app",
    "com.gpsmedical.patient_app.dev",
}
by = {}
project_info = None
for app_id in (base_id, dev_id):
    raw = subprocess.check_output(
        [
            "firebase",
            "apps:sdkconfig",
            "ANDROID",
            app_id,
            f"--project={project}",
            "--json",
        ],
        text=True,
    )
    result = json.loads(raw)["result"]
    if isinstance(result, str):
        result = json.loads(result)
    contents = result["fileContents"]
    if isinstance(contents, str):
        contents = json.loads(contents)
    project_info = contents["project_info"]
    for client in contents["client"]:
        pkg = client["client_info"]["android_client_info"]["package_name"]
        if pkg in wanted:
            by[pkg] = client

out = {
    "project_info": project_info,
    "client": [by[p] for p in sorted(by)],
    "configuration_version": "1",
}
path = Path("android/app/src/dev/google-services.json")
path.write_text(json.dumps(out, indent=2) + "\n")
print(f"trimmed {path} -> {list(by)}")
PY

# Ensure iOS plist matches the canonical patientApp app (not a sibling).
firebase apps:sdkconfig IOS "$IOS_APP_ID" --project="$PROJECT" \
  > ios/Runner/GoogleService-Info.plist

# Rewrite firebase_options.dart to match specialist/patient conventions.
python3 - <<'PY'
import re
from pathlib import Path

path = Path("lib/firebase_options.dart")
text = path.read_text()
android = re.search(
    r"static const FirebaseOptions android = FirebaseOptions\((.*?)\);",
    text,
    re.S,
).group(1)
ios = re.search(
    r"static const FirebaseOptions ios = FirebaseOptions\((.*?)\);",
    text,
    re.S,
).group(1)
path.write_text(
    """// File generated from Firebase config (gps-medical-dev).
// Re-run `make -C mobile configure-firebase-patient` after adding platforms or flavors.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for the Medora patient app.
class DefaultFirebaseOptions {
  static bool get isConfigured => true;

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(%s);

  static const FirebaseOptions ios = FirebaseOptions(%s);
}
"""
    % (android, ios)
)
print("normalized lib/firebase_options.dart")
PY

chmod +x scripts/patch_firebase_ios_build_configurations.sh
scripts/patch_firebase_ios_build_configurations.sh

echo ""
echo "Done. Verify:"
echo "  test -f android/app/src/dev/google-services.json"
echo "  test -f ios/Runner/GoogleService-Info.plist"
echo "  grep -q 'UNCONFIGURED' lib/firebase_options.dart && echo 'WARN: firebase_options still stub' || echo 'OK: firebase_options generated'"
echo "  Run with: flutter run --flavor dev --dart-define-from-file=config/dev.json"
