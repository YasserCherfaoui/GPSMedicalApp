#!/usr/bin/env bash
# Enforces ≥60% line coverage on patient_app lib/features/ (Phase 2 DoD).
set -euo pipefail

THRESHOLD="${FEATURES_COVERAGE_THRESHOLD:-60}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LCOV="$ROOT/coverage/lcov.info"

cd "$ROOT"
flutter test --exclude-tags staging --coverage

if [[ ! -f "$LCOV" ]]; then
  echo "Missing $LCOV after flutter test --coverage" >&2
  exit 1
fi

read -r LF LH < <(
  awk '
    /^SF:/ {
      file = substr($0, 4)
      in_features = (file ~ /lib\/features\//)
    }
    in_features && /^LF:/ { lf += substr($0, 4) }
    in_features && /^LH:/ { lh += substr($0, 4) }
    END { print lf, lh }
  ' "$LCOV"
)

if [[ "$LF" -eq 0 ]]; then
  echo "No lib/features/ lines found in coverage report" >&2
  exit 1
fi

PCT=$(awk -v lh="$LH" -v lf="$LF" 'BEGIN { printf "%.1f", 100 * lh / lf }')
echo "features/ line coverage: ${PCT}% (${LH}/${LF} lines, threshold ${THRESHOLD}%)"

awk -v pct="$PCT" -v threshold="$THRESHOLD" 'BEGIN { exit !(pct + 0 >= threshold + 0) }' || {
  echo "features/ coverage ${PCT}% is below ${THRESHOLD}% threshold" >&2
  exit 1
}
