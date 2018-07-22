#!/bin/bash
APP="ASUS Radeon RX 580 Graphic Driver"
HOMEPAGE="https://support.amd.com/en-us/kb-articles/Pages/Radeon-Software-for-Linux-Release-Notes.aspx"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo -e "Will be opening download page that contains the correct driver: \nRadeon™ Software for Linux® version 18.20 for Ubuntu 18.04 "
echo -e "\nSAVE IT INSIDE THE ~/Downloads folder!"
xdg-open https://support.amd.com/en-us/kb-articles/Pages/Radeon-Software-for-Linux-Release-Notes.aspx
echo ""
read -e -p "Press ENTER after the file has been downloaded and placed in ~/Downloads directory... " ECK
sudo tar -Jxvf ~/Downloads/amdgpu-pro-18.20-606296.tar.xz

echo "Installing $APP... "
sudo bash ~/Downloads/amdgpu-pro-18.20-606296/amdgpu-install -y

echo -e "$APP has finished installing.\n\n"
echo "---------------------------------------------------------------"
echo "Please restart the computer for the changes to take effect!"
echo -e "---------------------------------------------------------------\n\n"
