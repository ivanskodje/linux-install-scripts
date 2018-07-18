#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/connect-to-droplet.sh)
#
# Connect to droplet as root (root is default)
echo "----------------------------------------------------------------------"
echo "| Make sure you have your droplet password at hand before continuing |"
echo "----------------------------------------------------------------------"
read -e -p "Press enter to continue... "
doctl compute ssh $DROPLET_NAME --ssh-user root
