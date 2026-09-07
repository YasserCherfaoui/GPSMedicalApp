#!/usr/bin/env python3
"""Generate flavor app icons from the shared Medora launcher artwork.

Source of truth (client-provided):
  mobile/assets/new_icon_gemini.jpeg

Outputs 1024×1024 PNGs used by flutter_launcher_icons for patient + specialist
apps (dev / staging / prod all share the same mark).
"""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path

ICONS_DIR = Path(__file__).resolve().parent
ASSETS_DIR = ICONS_DIR.parent
SOURCE_JPEG = ASSETS_DIR / "new_icon_gemini.jpeg"
GEMINI_PNG = ICONS_DIR / "gps_medical_icon_gemini.png"

FLAVORS = ("prod", "staging", "dev")


def _sips_to_png(src: Path, dest: Path, size: int = 1024) -> None:
    """Convert/resize with macOS sips (available on CI mac runners + local)."""
    subprocess.run(
        [
            "sips",
            "-s",
            "format",
            "png",
            "-z",
            str(size),
            str(size),
            str(src),
            "--out",
            str(dest),
        ],
        check=True,
        capture_output=True,
    )


def main() -> int:
    if not SOURCE_JPEG.exists():
        print(f"Missing source icon: {SOURCE_JPEG}", file=sys.stderr)
        return 1

    print(f"Converting {SOURCE_JPEG.name} → {GEMINI_PNG.name} ({1024}×{1024})")
    _sips_to_png(SOURCE_JPEG, GEMINI_PNG)

    for flavor in FLAVORS:
        dest = ICONS_DIR / f"gps_medical_icon_{flavor}.png"
        shutil.copy2(GEMINI_PNG, dest)
        print(f"Synced {dest.name}")

    print("Done. Regenerate platform icons with:")
    print(
        "  cd patient_app && dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml"
    )
    print(
        "  cd specialist_app && dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
