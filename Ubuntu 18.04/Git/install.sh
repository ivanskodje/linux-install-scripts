#!/bin/bash
APP="Git"
HOMEPAGE="https://git-scm.com/"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n"

echo "Installing $APP... "
sudo apt-get install git -y

echo "Setting up git... "
read "Register your git name (John Doe): " NAME
git config --global user.name "$NAME"

read "Register your git account-email (your@email.com): " EMAIL
git config --global user.name "$EMAIL"

echo "Enabling global credential helper cache... "
git config --global credential.helper cache

echo -e "$APP has finished installing.\n\n"
