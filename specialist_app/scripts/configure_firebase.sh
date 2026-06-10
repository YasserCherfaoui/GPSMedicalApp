#!/usr/bin/env bash
# Registers Android/iOS apps in Firebase project gpsmedical and downloads config.
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

echo "Configuring FlutterFire for specialist_app (project gpsmedical)..."
flutterfire configure \
  --project=gpsmedical \
  --yes \
  --overwrite-firebase-options \
  --platforms=android,ios \
  --ios-bundle-id=com.gpsmedical.specialistApp \
  --android-package-name=com.gpsmedical.specialist_app.dev \
  --android-out=android/app/src/dev \
  --ios-out=ios/Runner

echo ""
echo "Done. Verify:"
echo "  test -f android/app/src/dev/google-services.json"
echo "  test -f ios/Runner/GoogleService-Info.plist"
echo "  test -f lib/firebase_options.dart"
