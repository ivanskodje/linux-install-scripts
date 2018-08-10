#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04
APP="MegaSync"
HOMEPAGE="https://mega.nz"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Downloading the file... "
sudo wget https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb -P ~/Downloads

echo "Installing $APP... "
sudo dpkg -i ~/Downloads/megasync-xUbuntu_18.04_amd64.deb
sudo apt-get install --fix-broken -y

echo "Cleaning file... "
sudo rm ~/Downloads/megasync-xUbuntu_18.04_amd64.deb

echo -e "$APP has finished installing.\n"
