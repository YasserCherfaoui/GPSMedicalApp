import os
import subprocess

def main():
    icons_dir = os.path.dirname(os.path.abspath(__file__))
    master_svg_path = os.path.join(icons_dir, "gps_medical_icon_master.svg")
    
    with open(master_svg_path, "r") as f:
        master_content = f.read()

    # Define color mappings for the backgrounds
    flavors = {
        "dev": {
            "start": "#34D399",
            "end": "#059669"
        },
        "staging": {
            "start": "#8B5CF6",
            "end": "#5B21B6"
        },
        "prod": {
            "start": "#2E90E6",
            "end": "#1565C0"
        }
    }

    # Custom rsvg-convert path or fallback to command
    rsvg_path = "/opt/homebrew/bin/rsvg-convert"
    if not os.path.exists(rsvg_path):
        rsvg_path = "rsvg-convert"

    for flavor, colors in flavors.items():
        svg_content = master_content.replace("#2E90E6", colors["start"]).replace("#1565C0", colors["end"])
        
        svg_filename = f"gps_medical_icon_{flavor}.svg"
        svg_path = os.path.join(icons_dir, svg_filename)
        
        with open(svg_path, "w") as f:
            f.write(svg_content)
        print(f"Generated {svg_path}")
        
        # Render SVG to 1024x1024 PNG
        png_filename = f"gps_medical_icon_{flavor}.png"
        png_path = os.path.join(icons_dir, png_filename)
        
        try:
            cmd = [rsvg_path, "-w", "1024", "-h", "1024", svg_path, "-o", png_path]
            subprocess.run(cmd, check=True)
            print(f"Rendered {png_path}")
        except Exception as e:
            print(f"Failed to render PNG for {flavor}: {e}")

if __name__ == "__main__":
    main()
