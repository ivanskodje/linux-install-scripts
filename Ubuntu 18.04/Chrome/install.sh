#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04

APP="Google Chrome Browser"
HOMEPAGE="https://www.google.com/chrome/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"


echo "Installing dependencies... "
sudo apt-get install libxss1 libappindicator1 libindicator7 -y

echo "Downloading the file... "
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb



echo "Installing $APP... "
sudo dpkg -i google-chrome*.deb
sudo apt-get install --fix-broken -y

echo "Cleaning file... "
sudo rm google-chrome*.deb

echo -e "$APP has finished installing.\n\n"
