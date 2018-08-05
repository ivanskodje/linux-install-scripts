#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04

APP="Exfat-fuse & utils"

echo "-------------------------------"
echo "INSTALLING: $APP"

echo "Installing $APP... "
sudo apt-get install exfat-fuse exfat-utils -y

echo -e "$APP has finished installing.\n\n"
