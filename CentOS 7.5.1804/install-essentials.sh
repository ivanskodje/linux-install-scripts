#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-essentials.sh)

read -e -p "Would you like to install nano, wget, git & tree (Y/n)? " RESP
if [ -z "$RESP" ]; then
  RESP = "Y"
fi

if [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
  # Install nano text editor
  yum install nano -y

  # Install wget (used to download files from the web)
  yum install wget -y

  # Install GIT
  yum install git -y

  # Install Tree (in order to view file directory structure by using the command)
  yum install tree -y
fi
