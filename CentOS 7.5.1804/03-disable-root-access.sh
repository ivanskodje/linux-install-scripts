#######################################################################################
# NB: Make sure you have created another user with root permissions (in group wheel)!
#######################################################################################

# Create a backup file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup_$(date +'%Y%m%d')

# Replace #PermitRootLogin yes with PermitRootLogin no
sed -e 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config > /sshd_config_tmp && mv /sshd_config_tmp /etc/ssh/sshd_config

# Restart sshd service
systemctl restart sshd.service
