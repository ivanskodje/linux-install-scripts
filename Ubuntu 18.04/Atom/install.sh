#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04

APP="Atom"
HOMEPAGE="https://atom.io/"
DOWNLOAD_URL="https://atom-installer.github.com/v1.28.2/atom-amd64.deb"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

echo "Making sure curl is installed... "
sudo apt-get install curl -y

echo "Adding official package repository... "
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update

echo "Installing $APP... "
sudo apt-get install atom -y

echo -e "$APP has finished installing.\n\n"
