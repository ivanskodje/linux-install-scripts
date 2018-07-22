#!/bin/bash
APP="KeePass2"
HOMEPAGE="https://keepass.info/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

echo "Installing dependencies... (needed for KeePassHTTP Plugin)"
sudo apt-get install mono-complete -y

echo "Installing $APP... "
sudo apt-get install keepass2 -y

echo "Downloading and installing KeePassHTTP plugin... "
sudo wget https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx -P /usr/lib/keepass2/Plugins/

echo -e "$APP has finished installing.\n\n"
