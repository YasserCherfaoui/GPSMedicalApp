#!/usr/bin/env python3
"""Generate flavor app icons from official branding/Logo assets.

Replaces the legacy stethoscope mark. Source of truth:
  branding/Logo/Icon/SVG/
"""

from __future__ import annotations

import os
import shutil
import subprocess
from pathlib import Path

ICONS_DIR = Path(__file__).resolve().parent
BRANDING_ROOT = ICONS_DIR.parents[2] / "branding" / "Logo" / "Icon"
BRANDING_SVG = BRANDING_ROOT / "SVG" / "Artboard 1 copy 2.svg"
BRANDING_PNG = BRANDING_ROOT / "icon png" / "Artboard 1 copy 2@300x-8.png"

# Medora palette backgrounds (opaque — required for iOS App Store).
FLAVORS = {
    "prod": {
        "bg": "#002432",
        "label": None,
    },
    "staging": {
        "bg": "#154c6a",
        "label": "S",
    },
    "dev": {
        "bg": "#0d3f42",
        "label": "D",
    },
}

# GPS / Medora mark path from branding SVG (viewBox 1080×1080).
MARK_PATH = (
    "M884.83,530.04h-195.28c-.22-.01-.44-.03-.66-.03l-75.36-.24"
    "c-4.18-.01-7.74-8.95-7.75-12.34l-.28-96.62c-.01-4.62-10.44-9.76-14.71-9.73"
    "l-72.7.5-88.88,112.09c-2.82,3.56-6.2,7.11-8.72,8.95-2.83,2.07-14.08.35-14.11-3.92"
    "l-.79-107.88c-1.9-6.16-13.3-9.81-19.48-9.73l-60.5.74c-5.45.07-13.12,10.63-16.42,14.8"
    "l-74.06,93.76-53.94,66.72-.4,70.77c-.25,4.66,4.38,10.64,9.59,10.66l77.73.17"
    "l56.79-69.62,38.25-47.25c1.18-1.46,5.95-4.37,7.58-3.43l9.49,5.52.09,103.67"
    "c0,6.67,6.19,11.38,12.09,11.32l74.13-.64,66.84-84.21c7.46-9.4,14.2-17.26,23.16-25.31"
    "l13.4,11.14-.17,55.82c-.06,19.69,13.34,40.6,34.73,41.92,25.35,1.56,49.6,1.15,75.05.94"
    "v.05h219.69v-124.19c0-7.95-6.45-14.4-14.4-14.4Z"
)


def _rsvg() -> str:
    homebrew = "/opt/homebrew/bin/rsvg-convert"
    return homebrew if os.path.exists(homebrew) else "rsvg-convert"


def _build_svg(bg: str, label: str | None) -> str:
    badge = ""
    if label:
        badge = f"""
  <circle cx="860" cy="164" r="96" fill="#5bb39b"/>
  <text x="860" y="164" text-anchor="middle" dominant-baseline="central"
        font-family="Helvetica, Arial, sans-serif" font-size="88" font-weight="700"
        fill="#002432">{label}</text>
"""
    return f"""<?xml version="1.0" encoding="UTF-8"?>
<svg width="1024" height="1024" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="mark" x1="180.77" y1="540" x2="899.23" y2="540" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#c1c8ce"/>
      <stop offset=".38" stop-color="#7ba4bd"/>
      <stop offset=".56" stop-color="#327ba7"/>
      <stop offset=".78" stop-color="#154c6a"/>
      <stop offset="1" stop-color="#002432"/>
    </linearGradient>
  </defs>
  <rect width="1024" height="1024" rx="225" ry="225" fill="{bg}"/>
  <g transform="translate(512 512) scale(0.78) translate(-540 -540)">
    <path fill="url(#mark)" d="{MARK_PATH}"/>
  </g>{badge}
</svg>
"""


def main() -> None:
    rsvg = _rsvg()
    shared_branding = ICONS_DIR.parents[1] / "shared_lib" / "assets" / "branding"
    shared_branding.mkdir(parents=True, exist_ok=True)

    # Canonical in-app assets (transparent gradient mark + primary solid).
    if BRANDING_PNG.exists():
        shutil.copy2(BRANDING_PNG, shared_branding / "medora_icon_gradient.png")
        print(f"Synced {shared_branding / 'medora_icon_gradient.png'}")

    primary_png = BRANDING_ROOT / "icon png" / "Artboard 1 copy 3@300x-8.png"
    if primary_png.exists():
        shutil.copy2(primary_png, shared_branding / "medora_icon_primary.png")
        print(f"Synced {shared_branding / 'medora_icon_primary.png'}")

    wordmark = (
        ICONS_DIR.parents[2]
        / "branding"
        / "Logo"
        / "Full Logo all variations"
        / "Full logo png"
        / "Artboard 1 copy 2.png"
    )
    if wordmark.exists():
        shutil.copy2(wordmark, shared_branding / "medora_wordmark_gradient.png")
        print(f"Synced {shared_branding / 'medora_wordmark_gradient.png'}")

    # Master SVG = branding gradient mark (no stethoscope).
    if BRANDING_SVG.exists():
        shutil.copy2(BRANDING_SVG, ICONS_DIR / "gps_medical_icon_master.svg")
        print(f"Updated master SVG from {BRANDING_SVG.name}")

    for flavor, cfg in FLAVORS.items():
        svg_path = ICONS_DIR / f"gps_medical_icon_{flavor}.svg"
        png_path = ICONS_DIR / f"gps_medical_icon_{flavor}.png"
        svg_path.write_text(_build_svg(cfg["bg"], cfg["label"]), encoding="utf-8")
        print(f"Wrote {svg_path.name}")
        try:
            subprocess.run(
                [rsvg, "-w", "1024", "-h", "1024", str(svg_path), "-o", str(png_path)],
                check=True,
            )
            print(f"Rendered {png_path.name}")
        except Exception as exc:  # noqa: BLE001
            print(f"Failed to render PNG for {flavor}: {exc}")

    # Remove legacy sized stethoscope exports if present.
    legacy = [
        "gps_medical_icon_48.png",
        "gps_medical_icon_72.png",
        "gps_medical_icon_96.png",
        "gps_medical_icon_120.png",
        "gps_medical_icon_144.png",
        "gps_medical_icon_152.png",
        "gps_medical_icon_167.png",
        "gps_medical_icon_180.png",
        "gps_medical_icon_192.png",
        "gps_medical_icon_512.png",
        "gps_medical_icon_1024.png",
    ]
    for name in legacy:
        path = ICONS_DIR / name
        if path.exists():
            path.unlink()
            print(f"Removed legacy {name}")


if __name__ == "__main__":
    main()
