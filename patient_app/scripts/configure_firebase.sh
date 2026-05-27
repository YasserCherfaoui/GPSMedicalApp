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

echo "Configuring FlutterFire for project gps-medical-dev..."
flutterfire configure \
  --project=gps-medical-dev \
  --yes \
  --overwrite-firebase-options \
  --platforms=android,ios \
  --ios-bundle-id=com.gpsmedical.patientApp \
  --android-package-name=com.gpsmedical.patient_app.dev \
  --android-out=android/app/src/dev \
  --ios-out=ios/Runner

echo ""
echo "Done. Verify:"
echo "  test -f android/app/src/dev/google-services.json"
echo "  test -f ios/Runner/GoogleService-Info.plist"
echo "  grep -q 'UNCONFIGURED' lib/firebase_options.dart && echo 'WARN: firebase_options still stub' || echo 'OK: firebase_options generated'"
