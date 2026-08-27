#!/usr/bin/env bash
# A-19.1: viewer must not load three.js / Draco from a CDN.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VIEWER="$ROOT/assets/pain3d/pain_viewer.html"

if [[ ! -f "$VIEWER" ]]; then
  echo "Missing $VIEWER" >&2
  exit 1
fi

if grep -E 'cdn\.jsdelivr|unpkg\.com|cdnjs\.cloudflare|ajax\.googleapis' "$VIEWER"; then
  echo "CDN URL found in pain_viewer.html — three.js and Draco must be local." >&2
  exit 1
fi

if ! grep -q "setDecoderPath('./draco/')" "$VIEWER"; then
  echo "pain_viewer.html must call setDecoderPath('./draco/')" >&2
  exit 1
fi

echo "pain3d viewer: local three.js + ./draco/ (no CDN)"
