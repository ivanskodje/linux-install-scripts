#################################################################
# These are some misc security snippets to help server security.
#################################################################

##################################
# Disable USB Storage
##################################
sudo bash -c "echo 'install usb-storage /bin/false' > /etc/modprobe.d/usb-storage.conf"

##################################
# UNFINISHED: Firewall setup 1
##################################
# Install the epel-release
# sudo yum install epel-release -y
# sudo yum install iptables-services -y
# sudo systemctl start iptables
# sudo systemctl enable iptables


##################################
# ALT: Install and enable the firewall
##################################
# Install firewalld
# sudo yum install firewalld -y

# Start firewalld (this alone does not make it enabled after a restart!)
# sudo systemctl start firewalld

# Confirm that it is running
# sudo firewall-cmd --state

#---------------------------------------------------------------
# NB: Recommended that you test the firewall before doing this!
#---------------------------------------------------------------
# Enable the firewall on boot 
# sudo systemctl enable firewalld
# sudo reboot

