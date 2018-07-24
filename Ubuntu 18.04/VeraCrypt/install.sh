#!/bin/bash
APP="VeraCrypt"
HOMEPAGE="https://www.veracrypt.fr"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Downloading the file... "
sudo wget https://launchpad.net/veracrypt/trunk/1.22/+download/veracrypt-1.22-setup.tar.bz2 -P ~/Downloads

echo "Unpacking... "
sudo tar -xvjf ~/Downloads/veracrypt-1.22-setup.tar.bz2

echo "Installing $APP... Continue by interacting with the VeraCrypt installation window."
sudo bash veracrypt-1.22-setup-gui-x64

echo "Cleaning files... "
sudo rm ~/Downloads/veracrypt-1.22*

echo -e "$APP has finished installing.\n"
