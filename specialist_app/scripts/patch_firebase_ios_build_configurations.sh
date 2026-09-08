#!/usr/bin/env bash
# Ensures firebase.json maps every Xcode build configuration to GoogleService-Info.plist.
# flutterfire configure writes ios.default only; the Xcode bundle-service-file script
# requires ios.buildConfigurations when flavor xcconfigs exist.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FIREBASE_JSON="$ROOT/firebase.json"
PBXPROJ="$ROOT/ios/Runner.xcodeproj/project.pbxproj"

if [[ ! -f "$FIREBASE_JSON" ]]; then
  echo "patch_firebase_ios_build_configurations: missing $FIREBASE_JSON"
  exit 1
fi

python3 - "$FIREBASE_JSON" "$PBXPROJ" <<'PY'
import json
import re
import sys
from pathlib import Path

firebase_json_path = Path(sys.argv[1])
pbxproj_path = Path(sys.argv[2])

data = json.loads(firebase_json_path.read_text())
flutter = data.setdefault("flutter", {})
platforms = flutter.setdefault("platforms", {})
ios = platforms.setdefault("ios", {})

# Source template: existing buildConfigurations entry, or ios.default.
template = None
if "buildConfigurations" in ios and ios["buildConfigurations"]:
    template = next(iter(ios["buildConfigurations"].values()))
if template is None and "default" in ios:
    template = ios["default"]

if not template:
    print(
        "patch_firebase_ios_build_configurations: no ios.default or "
        "ios.buildConfigurations in firebase.json; skip",
        file=sys.stderr,
    )
    sys.exit(0)

pbx = pbxproj_path.read_text()
config_names = sorted(
    set(re.findall(r'\n\t\t\tname = "([^"]+)";\n', pbx))
    - {"Runner", "RunnerTests"}
)
# Keep only Xcode build configuration names (Debug*, Release*, Profile*).
config_names = [
    n
    for n in config_names
    if n
    in {
        "Debug",
        "Profile",
        "Release",
        "Debug-dev",
        "Profile-dev",
        "Release-dev",
        "Debug-staging",
        "Profile-staging",
        "Release-staging",
        "Debug-prod",
        "Profile-prod",
        "Release-prod",
    }
]

ios["buildConfigurations"] = {name: dict(template) for name in config_names}
ios.pop("default", None)

firebase_json_path.write_text(json.dumps(data, indent=2) + "\n")
print(
    f"patch_firebase_ios_build_configurations: mapped {len(config_names)} "
    "iOS build configurations"
)
PY
