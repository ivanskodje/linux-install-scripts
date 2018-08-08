#!/bin/bash

# Create folder for the app
sudo mkdir /opt/godot
cd /opt/godot

# Download Godot Engine
sudo wget https://downloads.tuxfamily.org/godotengine/3.0.6/mono/Godot_v3.0.6-stable_mono_x11_64.zip

# Extract file to godot folder
sudo unzip -j /opt/godot/Godot_v3.0.6-stable_mono_x11_64.zip

# Remove zip file
sudo rm /opt/godot/Godot_v3.0.6-stable_mono_x11_64.zip

# Add some nice permissions
sudo chmod 775 /opt/godot/Godot_v3.0.6-stable_mono_x11.64

# Create desktop shortcut
cat >> ~/Desktop/Godot-Engine.desktop << EOF
[Desktop Entry]
Type=Application
Terminal=false
Name=Godot-Engine
Exec=/opt/godot/Godot_v3.0.6-stable_mono_x11.64
EOF

# Make executable (may not be needed, but better to be safe than sorry!)
sudo chmod +x ~/Desktop/Godot-Engine.desktop
