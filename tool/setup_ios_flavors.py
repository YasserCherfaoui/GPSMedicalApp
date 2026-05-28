import os
import re

def process_app(app_dir, app_type):
    ios_dir = os.path.join(app_dir, "ios")
    pbxproj_path = os.path.join(ios_dir, "Runner.xcodeproj", "project.pbxproj")
    podfile_path = os.path.join(ios_dir, "Podfile")
    info_plist_path = os.path.join(ios_dir, "Runner", "Info.plist")
    flutter_dir = os.path.join(ios_dir, "Flutter")
    
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
 project_name: 'Runner', # specify the project name explicitly
}"""

    # Let's replace the project declaration in Podfile if it matches original
    if original_podfile_proj in podfile_content:
        podfile_content = podfile_content.replace(original_podfile_proj, new_podfile_proj.replace(" project_name: 'Runner', # specify the project name explicitly", ""))
        with open(podfile_path, "w") as f:
            f.write(podfile_content)
        print("Updated Podfile configuration mapping")

    # 3. Create the .xcconfig files under ios/Flutter/
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

    # Deterministic file reference IDs for our new .xcconfig files
    # Format: Prefix + FileRefIdSuffix
    # We base them on Debug (9740EEB21CF90195004384FC) and Release (7AFA3C8E1D35360C0083082E) file ref IDs
    new_xcconfig_ids = {}
    for flavor, info in flavors.items():
        prefix = info["prefix"]
        new_xcconfig_ids[f"Debug-{flavor}"] = f"{prefix}40EEB21CF90195004384FC"
        new_xcconfig_ids[f"Release-{flavor}"] = f"{prefix}FA3C8E1D35360C0083082E"
        new_xcconfig_ids[f"Profile-{flavor}"] = f"{prefix}FA3C8E1D35360C0083082F" # incremented last char to make it unique from Release

    for flavor in flavors.keys():
        for build_type in ["Debug", "Release", "Profile"]:
            cfg_name = f"{build_type}-{flavor}"
            cfg_path = os.path.join(flutter_dir, f"{cfg_name}.xcconfig")
            
            # Content of xcconfig
            lowercase_type = build_type.lower()
            content = f'#include? "Pods/Target Support Files/Pods-Runner/Pods-Runner.{lowercase_type}-{flavor}.xcconfig"\n#include "Generated.xcconfig"\n'
            
            with open(cfg_path, "w") as f:
                f.write(content)
            print(f"Created config file {cfg_path}")

    # 4. Modify project.pbxproj
    with open(pbxproj_path, "r") as f:
        pbx_content = f.read()

    # 4a. Add PBXFileReference entries for the new config files
    file_ref_section_match = re.search(
        r'(/\* Begin PBXFileReference section \*/\n)([\s\S]*?)(\n\s*/\* End PBXFileReference section \*/)',
        pbx_content
    )
    if file_ref_section_match:
        begin_fr = file_ref_section_match.group(1)
        fr_block = file_ref_section_match.group(2)
        end_fr = file_ref_section_match.group(3)
        
        new_fr_block = fr_block
        for name, file_ref_id in new_xcconfig_ids.items():
            fr_line = f'\t\t{file_ref_id} /* {name}.xcconfig */ = {{isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = "{name}.xcconfig"; path = "Flutter/{name}.xcconfig"; sourceTree = "<group>"; }};'
            if file_ref_id not in pbx_content:
                new_fr_block += "\n" + fr_line
        pbx_content = pbx_content.replace(fr_block, new_fr_block)
        print("Registered xcconfig files in PBXFileReference section")

    # 4b. Add children to Flutter group (9740EEB11CF90186004384FC)
    group_regex = r'(9740EEB11CF90186004384FC /\* Flutter \*/ = \{\n\s*isa = PBXGroup;\n\s*children = \(\n)([\s\S]*?)(\n\s*\);)'
    group_match = re.search(group_regex, pbx_content)
    if group_match:
        start_grp = group_match.group(1)
        grp_children = group_match.group(2)
        end_grp = group_match.group(3)
        
        new_grp_children = grp_children
        for name, file_ref_id in new_xcconfig_ids.items():
            child_line = f'\t\t\t\t{file_ref_id} /* {name}.xcconfig */,'
            if child_line not in new_grp_children:
                new_grp_children += "\n" + child_line
        
        # Replace the group children block
        original_grp_block = start_grp + grp_children + end_grp
        new_grp_block = start_grp + new_grp_children + end_grp
        pbx_content = pbx_content.replace(original_grp_block, new_grp_block)
        print("Added xcconfig files to Flutter group")

    # 4c. Duplicate Configurations
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

    config_regex = r'(\t\t([0-9A-Z]{24}) /\* ([^*]+) \*/ = \{\n\t\t\tisa = XCBuildConfiguration;\n([\s\S]*?)\n\t\t\};)'
    configs = re.findall(config_regex, configs_block)
    
    new_configs_text = configs_block

    for config_text, config_id, name, inner_body in configs:
        for flavor, flavor_info in flavors.items():
            prefix = flavor_info["prefix"]
            new_id = prefix + config_id[2:]
            
            # Skip if this flavor configuration already exists in the text
            if new_id in pbx_content:
                continue

            # Duplicate the block, renaming the configuration name
            new_config_text = config_text
            new_config_text = new_config_text.replace(config_id, new_id)
            new_config_text = new_config_text.replace(f"/* {name} */", f"/* {name}-{flavor} */")
            new_config_text = new_config_text.replace(f"name = {name};", f"name = {name}-{flavor};")
            
            # Update baseConfigurationReference if it exists in the original block
            if "baseConfigurationReference" in inner_body:
                if name == "Debug":
                    new_config_text = new_config_text.replace(
                        "baseConfigurationReference = 9740EEB21CF90195004384FC /* Debug.xcconfig */;",
                        f"baseConfigurationReference = {new_xcconfig_ids['Debug-' + flavor]} /* Debug-{flavor}.xcconfig */;"
                    )
                elif name == "Release":
                    new_config_text = new_config_text.replace(
                        "baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;",
                        f"baseConfigurationReference = {new_xcconfig_ids['Release-' + flavor]} /* Release-{flavor}.xcconfig */;"
                    )
                elif name == "Profile":
                    new_config_text = new_config_text.replace(
                        "baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;",
                        f"baseConfigurationReference = {new_xcconfig_ids['Profile-' + flavor]} /* Profile-{flavor}.xcconfig */;"
                    )

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
                
                # Replace the original ASSETCATALOG_COMPILER_APPICON_NAME setting
                new_config_text = new_config_text.replace(
                    "ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;",
                    f'ASSETCATALOG_COMPILER_APPICON_NAME = {flavor_info["app_icon"]};'
                ).replace(
                    'ASSETCATALOG_COMPILER_APPICON_NAME = "AppIcon";',
                    f'ASSETCATALOG_COMPILER_APPICON_NAME = {flavor_info["app_icon"]};'
                )

                # Insert APP_DISPLAY_NAME build setting right after buildSettings = {
                settings_to_add = f'\t\t\t\tAPP_DISPLAY_NAME = "{flavor_info["app_name"]}";'
                new_config_text = new_config_text.replace(
                    "buildSettings = {\n",
                    "buildSettings = {\n" + settings_to_add + "\n"
                )
                
            new_configs_text += "\n" + new_config_text

    # Replace the XCBuildConfiguration section
    pbx_content = pbx_content.replace(configs_block, new_configs_text)
    print("Added duplicated configurations to project.pbxproj")

    # 4d. Update the XCConfigurationList section
    # Target list IDs (constant across both apps)
    lists = {
        "331C8087294A63A400263BE5": "RunnerTests",
        "97C146E91CF9000F007C117D": "Project",
        "97C147051CF9000F007C117D": "RunnerTarget"
    }

    for list_id, list_name in lists.items():
        # Match the buildConfigurations list block
        list_regex = r'(\t\t' + list_id + r' /\* Build configuration list for[^*]+?\*/ = \{\n[\s\S]*?buildConfigurations = \(\n)([\s\S]*?)(\n\s*\);)'
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
                        if not new_items.endswith("\n"):
                            new_items += "\n"
                        flavor_config_line = f"\t\t\t\t{flavor_config_id} /* {name}-{flavor} */,\n"
                        if flavor_config_id not in new_items:
                            new_items += flavor_config_line
                            
            pbx_content = pbx_content.replace(start_part + original_items + end_part, start_part + new_items + end_part)
            
            # Update defaultConfigurationName to Release-prod
            pbx_content = pbx_content.replace(
                "defaultConfigurationName = Release;",
                "defaultConfigurationName = Release-prod;"
            )
            print(f"Updated build configuration list for {list_name}")

    # 4e. Update default Debug, Release, Profile configurations of target Runner
    default_mappings = {
        "97C147061CF9000F007C117D": { # Debug
            "app_name": "GPS Pat Dev" if app_type == "patient" else "GPS Spec Dev",
            "app_icon": "AppIcon-dev",
            "bundle_suffix": ".dev"
        },
        "97C147071CF9000F007C117D": { # Release
            "app_name": "GPS Patient" if app_type == "patient" else "GPS Spécialiste",
            "app_icon": "AppIcon-prod",
            "bundle_suffix": ""
        },
        "249021D4217E4FDB00AE95B9": { # Profile
            "app_name": "GPS Patient" if app_type == "patient" else "GPS Spécialiste",
            "app_icon": "AppIcon-prod",
            "bundle_suffix": ""
        }
    }
    
    for config_id, mapping in default_mappings.items():
        config_pattern = r'(\t\t' + config_id + r' /\* [^*]+ \*/ = \{\n\t\t\tisa = XCBuildConfiguration;\n[\s\S]*?\n\t\t\};)'
        match = re.search(config_pattern, pbx_content)
        if match:
            block = match.group(1)
            new_block = block
            
            # Replace AppIcon
            new_block = new_block.replace(
                "ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;",
                f"ASSETCATALOG_COMPILER_APPICON_NAME = {mapping['app_icon']};"
            ).replace(
                'ASSETCATALOG_COMPILER_APPICON_NAME = "AppIcon";',
                f"ASSETCATALOG_COMPILER_APPICON_NAME = {mapping['app_icon']};"
            )
            
            # Replace Bundle ID
            orig_bundle = "com.gpsmedical.patientApp" if app_type == "patient" else "com.gpsmedical.specialistApp"
            new_bundle = orig_bundle + mapping["bundle_suffix"]
            new_block = new_block.replace(orig_bundle, new_bundle)
            
            # Add APP_DISPLAY_NAME
            if "APP_DISPLAY_NAME" not in new_block:
                settings_to_add = f'\t\t\t\tAPP_DISPLAY_NAME = "{mapping["app_name"]}";'
                new_block = new_block.replace(
                    "buildSettings = {\n",
                    "buildSettings = {\n" + settings_to_add + "\n"
                )
            
            pbx_content = pbx_content.replace(block, new_block)
            print(f"Updated default target config {config_id} to use {mapping['app_name']} ({mapping['app_icon']})")

    with open(pbxproj_path, "w") as f:
        f.write(pbx_content)

    # 5. Create Schemes
    schemes_dir = os.path.join(ios_dir, "Runner.xcodeproj", "xcshareddata", "xcschemes")
    os.makedirs(schemes_dir, exist_ok=True)
    
    master_scheme_path = os.path.join(schemes_dir, "Runner.xcscheme")
    if not os.path.exists(master_scheme_path):
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
