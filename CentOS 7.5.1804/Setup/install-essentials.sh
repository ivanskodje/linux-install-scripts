#!/bin/bash
read -e -p "Would you like to install ALL essentials at once? (y/n)" RESP
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



# Install nano text editor
yum install nano -y

# Install wget (used to download files from the web)
yum install wget -y

# Install GIT
yum install git -y

# Install Tree (in order to view file directory structure by using the command)
yum install tree -y
