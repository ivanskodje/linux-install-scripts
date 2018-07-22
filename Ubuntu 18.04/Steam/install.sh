#!/bin/bash
APP="Steam"
HOMEPAGE="https://store.steampowered.com/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Enable Multiverse Repository (which contains 'non-free' software ++)"
sudo add-apt-repository multiverse

echo "Installing $APP... "
sudo apt-get install steam -y

echo "Cleaning file... "
sudo rm ~/Downloads/megasync-xUbuntu_18.04_amd64.deb

echo -e "$APP has finished installing.\n"
