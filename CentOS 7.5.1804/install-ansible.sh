#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-ansible.sh)
#
# Documentation: https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7

# Ensure CentOS 7 EPEL Repo is installed
yum install epel-release -y

# Install Ansible
yum install ansible -y
