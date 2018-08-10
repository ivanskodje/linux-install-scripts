#!/bin/bash

# Delete all log
sudo rm ~/.local/share/recently-used.xbel

# Create dummy file
sudo touch ~/.local/share/recently-used.xbel

# Disable file editing
sudo chattr +i ~/.local/share/recently-used.xbel

# To enable it again:
# sudo chattr -i ~/.local/share/recently-used.xbel
