#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/increase-keepalive.sh)
#

echo ""
echo "-----------------------------------------------------------------------------------"
echo "NB: Make sure you have created another user with root permissions (in group wheel)!"
echo "-----------------------------------------------------------------------------------"
echo ""
read -e -p "(Highly Recommended) Would you like to disable remote root access? (Y/n) " RESP
if [ -z "$RESP" ]; then
  RESP = "Y"
fi

if [ "$RESP" == "n" ] || [ "$RESP" == "N" ]; then
  echo "Will not disable root access... "
  exit 1
elif [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
  # Create a backup
  echo "Creating a backup of sshd_config... "
  cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup_$(date +'%Y%m%d')

  # Replace #PermitRootLogin yes with PermitRootLogin no
  echo "Setting PermitRootLogin to no in sshd_config..."
  sed -e 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config > /sshd_config_tmp && mv /sshd_config_tmp /etc/ssh/sshd_config

  # Restart sshd service
  systemctl restart sshd.service
  echo "Root have successfully been disabled! Make sure you have created a user with sudo permissions before logging out!!!"
fi
