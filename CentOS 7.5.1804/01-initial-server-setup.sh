#!/bin/bash
# Installation and Setup for a clean CENTOS 7 hosted at Digitalocean.
# ---------------------------------------------
##############################
# --- MISC ---
# Update the system
yum update -y && yum upgrade -y

# Install nano text editor
yum install nano -y

# Install wget (used to download files from the web)
yum install wget -y

# Install GIT
yum install git -y

# Install Tree (in order to view file directory structure by using the command)
yum install tree -y

# Install GCC and Java
# yum install gcc -y
# yum install java -y

# Setup a keepalive interval for clients and the server
echo -e "\nClientAliveInterval 15" >> /etc/ssh/sshd_config
echo -e "\nHost *\n\tServerAliveCountMax 5\n\tServerAliveInterval 15" >> ~/.ssh/config


###############################
# --- Create 2GB SWAP ---
# Check available SWAP
free -m

# Create swap file (1024 * MB = Desired count)
dd if=/dev/zero of=/swapfile bs=1024 count=2048000

# Set appropriate 600 permissions
chmod 600 /swapfile

# Turn it into a swapfile
mkswap /swapfile

# Enable swapfile
swapon /swapfile

# Enable swapfile at boot time
echo -e "/swapfile \tswap \tswap \tdefaults \t0 0" >> /etc/fstab

# Confirm that swap space have been added
free -m
