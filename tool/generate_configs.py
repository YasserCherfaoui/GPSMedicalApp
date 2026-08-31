#!/usr/bin/env python3
"""Regenerate flutter_launcher_icons / flutter_native_splash YAML for all apps."""

import os

FLAVORS = ("dev", "staging", "prod")
ICON_DIR = "../assets/gps_medical_logo_icons"


def create_yaml_files(app_dir: str) -> None:
    for flavor in FLAVORS:
        icon = f"{ICON_DIR}/gps_medical_icon_{flavor}.png"
        icons_yaml = f"""flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path: "{icon}"
"""
        icons_path = os.path.join(app_dir, f"flutter_launcher_icons-{flavor}.yaml")
        with open(icons_path, "w", encoding="utf-8") as f:
            f.write(icons_yaml)
        print(f"Created {icons_path}")

        splash_yaml = f"""flutter_native_splash:
  color: "#ffffff"
  image: "{icon}"
  android_12:
    image: "{icon}"
    color: "#ffffff"
  android: true
  ios: true
"""
        splash_path = os.path.join(app_dir, f"flutter_native_splash-{flavor}.yaml")
        with open(splash_path, "w", encoding="utf-8") as f:
            f.write(splash_yaml)
        print(f"Created {splash_path}")


def main() -> None:
    mobile_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    create_yaml_files(os.path.join(mobile_dir, "patient_app"))
    create_yaml_files(os.path.join(mobile_dir, "specialist_app"))


if __name__ == "__main__":
    main()
