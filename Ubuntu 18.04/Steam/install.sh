#!/bin/bash
APP="Steam"
HOMEPAGE="https://store.steampowered.com/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Enable Multiverse Repository (which contains 'non-free' software ++)"
sudo add-apt-repository multiverse

echo "Installing $APP... "
sudo dpkg -i ~/Downloads/megasync-xUbuntu_18.04_amd64.deb
sudo apt-get install --fix-broken -y

echo "Cleaning file... "
sudo rm ~/Downloads/megasync-xUbuntu_18.04_amd64.deb

echo -e "$APP has finished installing.\n"
