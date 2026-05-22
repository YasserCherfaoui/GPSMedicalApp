import os

def create_yaml_files(app_dir):
    flavors = ["dev", "staging", "prod"]
    
    for flavor in flavors:
        # Launcher icons configuration
        icons_yaml = f"""flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "../gps_medical_logo_icons/gps_medical_icon_{flavor}.png"
"""
        icons_path = os.path.join(app_dir, f"flutter_launcher_icons-{flavor}.yaml")
        with open(icons_path, "w") as f:
            f.write(icons_yaml)
        print(f"Created {icons_path}")

        # Native splash configuration
        splash_yaml = f"""flutter_native_splash:
  color: "#ffffff"
  image: "../gps_medical_logo_icons/gps_medical_icon_{flavor}.png"
  android_12:
    image: "../gps_medical_logo_icons/gps_medical_icon_{flavor}.png"
    color: "#ffffff"
  android: true
  ios: true
"""
        splash_path = os.path.join(app_dir, f"flutter_native_splash-{flavor}.yaml")
        with open(splash_path, "w") as f:
            f.write(splash_yaml)
        print(f"Created {splash_path}")

def main():
    mobile_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    
    # Generate for patient_app
    patient_app_dir = os.path.join(mobile_dir, "patient_app")
    create_yaml_files(patient_app_dir)
    
    # Generate for specialist_app
    specialist_app_dir = os.path.join(mobile_dir, "specialist_app")
    create_yaml_files(specialist_app_dir)

if __name__ == "__main__":
    main()
