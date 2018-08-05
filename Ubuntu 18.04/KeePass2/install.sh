#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04
APP="KeePass2"
HOMEPAGE="https://keepass.info/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

echo "Adding repository..."
sudo add-apt-repository ppa:jtaylor/keepass -y
sudo apt-get update

echo "Installing dependencies... (needed for KeePassHTTP Plugin)"
sudo apt-get install mono-complete jq -y

echo "Installing $APP... "
sudo apt-get install keepass2 -y

echo "Downloading and installing plugins... "
curl -s https://api.github.com/repos/kee-org/keepassrpc/releases/latest | jq -r ".assets[] | select(.name | test(\"KeePassRPC.plgx\")) | .browser_download_url" | xargs sudo curl -s -L -o "/usr/lib/keepass2/Plugins/KeePassRPC.plgx" # Used for the FireFox Addon: Kee
sudo wget https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx -P /usr/lib/keepass2/Plugins/ # Used for Google Chrome's Extension: chromeIPass

echo -e "$APP has finished installing.\n\n"
