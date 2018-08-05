#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04
APP="Git"
HOMEPAGE="https://git-scm.com/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

echo "Installing $APP... "
sudo apt-get install git -y

echo "Setting up git... "
read -e p- "Register your git name (John Doe): " NAME
git config --global user.name "$NAME"

read -e -p "Register your git account-email (your@email.com): " EMAIL
git config --global user.name "$EMAIL"

echo -e -p "Enabling global credential helper cache... "
git config --global credential.helper cache

echo -e "$APP has finished installing.\n\n"
