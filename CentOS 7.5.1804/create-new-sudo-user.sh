#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/create-new-sudo-user.sh)
#

RESP=""
read -e -p "(Recommended) Do you wish to create a new account with sudo permissions? (Y/n) " RESP
if [ -z "$RESP" ]; then
  RESP="y"
fi

if [ "$RESP" == "n" ] || [ "$RESP" == "N" ]; then
  echo "Skipping user creation... "
  exit 1
elif [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    read -e -p "Enter the username you wish to use: " USERNAME
    echo "Creating a new sudo user by the name $USERNAME"
    adduser "$USERNAME"
    passwd "$USERNAME"
    gpasswd -a "$USERNAME" wheel
fi
