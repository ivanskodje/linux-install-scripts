#!/bin/bash
#################################
# --- ANSIBLE INSTALLATION ---
# Documentation: https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7

# Ensure CentOS 7 EPEL Repo is installed
yum install epel-release -y

# Install Ansible
yum install ansible -y
