#!/bin/bash
# This script will automate the initial software and application setup for new Ubuntu environments based on my own needs.

# Update
sudo apt-get update -y

# TODO: ...

# IntelliJ FIx for alt+ctrl+left/right:
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
