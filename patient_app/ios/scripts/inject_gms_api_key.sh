#!/bin/bash
# Copies API_KEY from GoogleService-Info.plist into the built app's Info.plist as GMSApiKey.
# The Maps SDK reads GMSApiKey at launch (see ADR 0009).
set -euo pipefail

APP_PLIST="${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/Info.plist"
SRC_PLIST="${SRCROOT}/Runner/GoogleService-Info.plist"

if [[ ! -f "$APP_PLIST" || ! -f "$SRC_PLIST" ]]; then
  exit 0
fi

# Prefer GOOGLE_MAPS_API_KEY from MapsSecrets.xcconfig (secrets.env workflow).
API_KEY="${GOOGLE_MAPS_API_KEY:-}"
if [[ -z "$API_KEY" && -f "$SRC_PLIST" ]]; then
  API_KEY="$(/usr/libexec/PlistBuddy -c 'Print :API_KEY' "$SRC_PLIST" 2>/dev/null || true)"
fi
if [[ -z "$API_KEY" ]]; then
  exit 0
fi

if /usr/libexec/PlistBuddy -c 'Print :GMSApiKey' "$APP_PLIST" >/dev/null 2>&1; then
  /usr/libexec/PlistBuddy -c "Set :GMSApiKey ${API_KEY}" "$APP_PLIST"
else
  /usr/libexec/PlistBuddy -c "Add :GMSApiKey string ${API_KEY}" "$APP_PLIST"
fi
