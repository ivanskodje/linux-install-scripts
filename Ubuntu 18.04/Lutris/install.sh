#!/bin/bash
APP="Lutris: Open gaming Platform"
HOMEPAGE="https://lutris.net"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Adding Repository..."
ver=$(lsb_release -sr); if [ $ver != "18.04" -a $ver != "17.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=18.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
sudo wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -
sudo apt-get update

echo "Installing $APP... "
sudo apt-get install lutris -y

echo "Installing dependencies needed for games such as World of Warcraft..."
sudo apt-get install ttf-mscorefonts-installer libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386 -y
sudo dpkg --add-architecture i386

echo "Installing Wine Staging... "
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt-get update
sudo apt-get install --install-recommends winehq-staging

echo -e "$APP has finished installing.\n"
