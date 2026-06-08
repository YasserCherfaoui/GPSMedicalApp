#!/usr/bin/env bash
# Fails when bundled images in the patient app exceed 200 KiB (task 9.7).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
MAX_BYTES=$((200 * 1024))
FAILED=0

check_dir() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0
  while IFS= read -r -d '' file; do
    local size
    size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file")
    if (( size > MAX_BYTES )); then
      echo "ERROR: ${file#$ROOT/} is ${size} bytes (> 200 KiB)"
      FAILED=1
    fi
  done < <(find "$dir" -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.webp' \) -print0)
}

check_dir "$ROOT/patient_app/assets"
check_dir "$ROOT/shared_lib/assets"
check_dir "$ROOT/patient_app/android/app/src/main/res"
check_dir "$ROOT/patient_app/ios/Runner/Assets.xcassets"

if (( FAILED != 0 )); then
  echo "Compress or resize assets before shipping."
  exit 1
fi

echo "Asset size check passed (<= 200 KiB)."
