#!/bin/bash
APP="Discord Client"
HOMEPAGE="https://discordapp.com"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"


echo "Downloading the file... "
wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb

echo "Installing $APP... "
sudo dpkg -i discord.deb
sudo apt-get install --fix-broken -y

echo "Cleaning file... "
sudo rm discord.deb

echo -e "$APP has finished installing.\n\n"
