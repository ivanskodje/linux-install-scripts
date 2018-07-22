#!/bin/bash
echo -e "This should fix the issue with screen flickering, using AMD RX 480 with Ubuntu 18.04: \n"

# Create a backup of grub
echo "Creating a backup of /etc/default/grub... "
cp /etc/default/grub /etc/default/grub_backup_$(date +'%Y%m%d')

# Replace GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" with GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.dc=0"
echo "Applying fix in grub..."
sed -e 's/quiet splash/quiet splash amdgpu.dc=0/' /etc/default/grub > /grub_tmp && mv /grub_tmp /etc/default/grub

# Update grub
echo "Updating grub..."
sudo update-grub

echo "AMD RX 480 Fix applied!"
