#!/bin/bash
APP="Exfat-fuse & utils"

echo "-------------------------------"
echo "INSTALLING: $APP"

echo "Installing $APP... "
sudo apt-get install exfat-fuse exfat-utils -y

echo -e "$APP has finished installing.\n\n"
