#!/bin/bash
# Works with Ubuntu 18.04, and Kubuntu 18.04
APP="Slack"
HOMEPAGE="https://slack.com"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Downloading the file... "
sudo wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb -P ~/Downloads

echo "Installing $APP... "
sudo apt install ~/Downloads/slack-desktop-3.2.1-amd64.deb -y

echo "Cleaning file(s)... "
sudo rm ~/Downloads/slack-desktop-3.2.1-amd64.deb

echo -e "$APP has finished installing.\n"
