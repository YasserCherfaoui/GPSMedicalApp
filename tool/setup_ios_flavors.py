import os
import re

def process_app(app_dir, app_type):
    ios_dir = os.path.join(app_dir, "ios")
    pbxproj_path = os.path.join(ios_dir, "Runner.xcodeproj", "project.pbxproj")
    podfile_path = os.path.join(ios_dir, "Podfile")
    info_plist_path = os.path.join(ios_dir, "Runner", "Info.plist")
    
    if not os.path.exists(pbxproj_path):
        print(f"Skipping {app_dir} - no project.pbxproj found.")
        return
        
    print(f"Configuring iOS for {app_type} at {app_dir}...")
    
    # 1. Modify Info.plist
    with open(info_plist_path, "r") as f:
        plist_content = f.read()
    
    # Make display name dynamic
    if "GPS Médical" in plist_content:
        plist_content = plist_content.replace(
            "<string>GPS Médical Patient</string>",
            "<string>$(APP_DISPLAY_NAME)</string>"
        ).replace(
            "<string>GPS Médical Spécialiste</string>",
            "<string>$(APP_DISPLAY_NAME)</string>"
        )
        with open(info_plist_path, "w") as f:
            f.write(plist_content)
        print("Updated Info.plist for dynamic APP_DISPLAY_NAME")

    # 2. Modify Podfile
    with open(podfile_path, "r") as f:
        podfile_content = f.read()
        
    original_podfile_proj = """project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
}"""

    new_podfile_proj = """project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
  'Debug-dev' => :debug,
  'Profile-dev' => :release,
  'Release-dev' => :release,
  'Debug-staging' => :debug,
  'Profile-staging' => :release,
  'Release-staging' => :release,
  'Debug-prod' => :debug,
  'Profile-prod' => :release,
  'Release-prod' => :release,
}"""

    if original_podfile_proj in podfile_content:
        podfile_content = podfile_content.replace(original_podfile_proj, new_podfile_proj)
        with open(podfile_path, "w") as f:
            f.write(podfile_content)
        print("Updated Podfile configuration mapping")

    # 3. Modify project.pbxproj
    with open(pbxproj_path, "r") as f:
        pbx_content = f.read()

    # Find the XCBuildConfiguration section
    section_match = re.search(
        r'(/\* Begin XCBuildConfiguration section \*/\n)([\s\S]*?)(\n\s*/\* End XCBuildConfiguration section \*/)',
        pbx_content
    )
    if not section_match:
        print("ERROR: XCBuildConfiguration section not found!")
        return

    begin_section = section_match.group(1)
    configs_block = section_match.group(2)
    end_section = section_match.group(3)

    # Regex to find individual configurations
    # Group 1: original block text
    # Group 2: config ID
    # Group 3: name comment
    config_regex = r'(\t\t([0-9A-F]{24}) /\* ([^*]+) \*/ = \{\n\t\t\tisa = XCBuildConfiguration;\n([\s\S]*?)\n\t\t\};)'
    
    configs = re.findall(config_regex, configs_block)
    
    # We will generate three sets of configs: dev, staging, prod
    flavors = {
        "dev": {
            "prefix": "DE",
            "suffix": ".dev",
            "app_name": "GPS Pat Dev" if app_type == "patient" else "GPS Spec Dev",
            "app_icon": "AppIcon-dev"
        },
        "staging": {
            "prefix": "ST",
            "suffix": ".staging",
            "app_name": "GPS Pat Stg" if app_type == "patient" else "GPS Spec Stg",
            "app_icon": "AppIcon-staging"
        },
        "prod": {
            "prefix": "PR",
            "suffix": "",
            "app_name": "GPS Patient" if app_type == "patient" else "GPS Spécialiste",
            "app_icon": "AppIcon-prod"
        }
    }

    new_configs_text = configs_block # Start with original configurations

    # Map of original ID to flavor config ID for list replacement
    flavor_id_maps = {
        "dev": {},
        "staging": {},
        "prod": {}
    }

    for config_text, config_id, name, inner_body in configs:
        for flavor, flavor_info in flavors.items():
            prefix = flavor_info["prefix"]
            new_id = prefix + config_id[2:]
            flavor_id_maps[flavor][config_id] = new_id
            
            # Skip if this flavor configuration already exists in the text
            if new_id in pbx_content:
                continue

            # Duplicate the block, renaming the configuration name
            new_config_text = config_text
            new_config_text = new_config_text.replace(config_id, new_id)
            new_config_text = new_config_text.replace(f"/* {name} */", f"/* {name}-{flavor} */")
            new_config_text = new_config_text.replace(f"name = {name};", f"name = {name}-{flavor};")
            
            # Check if this config belongs to Runner target (has product bundle identifier)
            # If so, insert flavor variables
            if "PRODUCT_BUNDLE_IDENTIFIER" in inner_body:
                # Update bundle ID
                if app_type == "patient":
                    orig_bundle = "com.gpsmedical.patientApp"
                else:
                    orig_bundle = "com.gpsmedical.specialistApp"
                
                new_bundle = orig_bundle + flavor_info["suffix"]
                
                # Check for RunnerTests target bundle id
                if "com.gpsmedical.patientApp.RunnerTests" in inner_body or "com.gpsmedical.specialistApp.RunnerTests" in inner_body:
                    # Keep tests bundle id same or flavored
                    pass
                else:
                    new_config_text = new_config_text.replace(orig_bundle, new_bundle)
                
                # Insert App Icon and Display Name build settings
                settings_to_add = f"""\t\t\t\tAPP_DISPLAY_NAME = "{flavor_info['app_name']}";\n\t\t\t\tASSETCATALOG_COMPILER_APPICON_NAME = {flavor_info['app_icon']};"""
                # Insert right after buildSettings = {
                new_config_text = new_config_text.replace(
                    "buildSettings = {\n",
                    "buildSettings = {\n" + settings_to_add + "\n"
                )
                
            new_configs_text += "\n" + new_config_text

    # Replace the XCBuildConfiguration section
    pbx_content = pbx_content.replace(configs_block, new_configs_text)
    print("Added duplicated configurations to project.pbxproj")

    # 4. Update the XCConfigurationList section
    # Target list IDs (constant across both apps)
    lists = {
        "331C8087294A63A400263BE5": "RunnerTests",
        "97C146E91CF9000F007C117D": "Project",
        "97C147051CF9000F007C117D": "RunnerTarget"
    }

    for list_id, list_name in lists.items():
        # Match the buildConfigurations list block
        list_regex = r'(' + list_id + r' /\* Build configuration list for[\s\S]*?buildConfigurations = \(\n)([\s\S]*?)(\n\s*\);)'
        match = re.search(list_regex, pbx_content)
        if match:
            start_part = match.group(1)
            original_items = match.group(2)
            end_part = match.group(3)
            
            new_items = original_items
            
            # Append dev, staging, prod build configurations if not already present
            for flavor, flavor_info in flavors.items():
                prefix = flavor_info["prefix"]
                
                for config_text, config_id, name, _ in configs:
                    if config_id in original_items:
                        flavor_config_id = prefix + config_id[2:]
                        flavor_config_line = f"\t\t\t\t{flavor_config_id} /* {name}-{flavor} */,\n"
                        if flavor_config_id not in new_items:
                            new_items += flavor_config_line
                            
            pbx_content = pbx_content.replace(original_items, new_items)
            
            # Update defaultConfigurationName to Release-prod
            pbx_content = pbx_content.replace(
                "defaultConfigurationName = Release;",
                "defaultConfigurationName = Release-prod;"
            )
            print(f"Updated build configuration list for {list_name}")

    with open(pbxproj_path, "w") as f:
        f.write(pbx_content)

    # 5. Create Schemes
    schemes_dir = os.path.join(ios_dir, "Runner.xcodeproj", "xcshareddata", "xcschemes")
    os.makedirs(schemes_dir, exist_ok=True)
    
    master_scheme_path = os.path.join(schemes_dir, "Runner.xcscheme")
    if not os.path.exists(master_scheme_path):
        # Fallback to copy template if missing
        print("ERROR: Runner.xcscheme not found!")
        return
        
    with open(master_scheme_path, "r") as f:
        master_scheme = f.read()

    for flavor in flavors.keys():
        flavor_scheme = master_scheme
        # Replace configuration names in scheme
        flavor_scheme = flavor_scheme.replace('buildConfiguration = "Debug"', f'buildConfiguration = "Debug-{flavor}"')
        flavor_scheme = flavor_scheme.replace('buildConfiguration = "Release"', f'buildConfiguration = "Release-{flavor}"')
        flavor_scheme = flavor_scheme.replace('buildConfiguration = "Profile"', f'buildConfiguration = "Profile-{flavor}"')
        
        flavor_scheme_path = os.path.join(schemes_dir, f"{flavor}.xcscheme")
        with open(flavor_scheme_path, "w") as f:
            f.write(flavor_scheme)
        print(f"Created iOS scheme {flavor_scheme_path}")

def main():
    tool_dir = os.path.dirname(os.path.abspath(__file__))
    mobile_dir = os.path.dirname(tool_dir)
    
    patient_app_dir = os.path.join(mobile_dir, "patient_app")
    process_app(patient_app_dir, "patient")
    
    specialist_app_dir = os.path.join(mobile_dir, "specialist_app")
    process_app(specialist_app_dir, "specialist")

if __name__ == "__main__":
    main()
