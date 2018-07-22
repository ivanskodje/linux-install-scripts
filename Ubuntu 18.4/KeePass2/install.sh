#!/bin/bash
APP="KeePass2"
HOMEPAGE="https://keepass.info/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

# TODO: Confirm that it works without this. If it does, remove this. Else we uncomment this to make it work.
# echo "Adding repository..."
# sudo add-apt-repository ppa:jtaylor/keepass -y
# sudo apt-get update

echo "Installing dependencies... "
sudo apt-get install mono-complete curl jq -y

echo "Installing $APP... "
sudo apt-get install keepass2 -y

echo "Downloading and installing plugin... "
curl -s https://api.github.com/repos/kee-org/keepassrpc/releases/latest | jq -r ".assets[] | select(.name | test(\"KeePassRPC.plgx\")) | .browser_download_url" | xargs sudo curl -s -L -o "/usr/lib/keepass2/Plugins/KeePassRPC.plgx"

echo -e "$APP has finished installing.\n\n"
