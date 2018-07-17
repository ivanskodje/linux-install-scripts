#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-docker.sh)
#
# Documentation: https://docs.docker.com/install/linux/docker-ce/centos/#install-using-the-repository

# Install required packages
yum install yum-utils device-mapper-persistent-data lvm2 -y

# Add stable repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker
yum install docker-ce -y

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Print a message with docker version
echo "Docker is done installing... "
docker version

##############################
# --- DOCKER-COMPOSE INSTALLATION ---
# Documentation: https://docs.docker.com/compose/install/#install-compose

# Download and install
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Apply permissions
chmod +x /usr/local/bin/docker-compose

# Print a message with docker-compose version
echo "Docker Compose is done installing... "
docker-compose --version

################################
# --- DOCKER-MACHINE INSTALLATION ---
# Documentation: https://docs.docker.com/machine/install-machine/#install-machine-directly

# Download and install
base=https://github.com/docker/machine/releases/download/v0.14.0 && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && install /tmp/docker-machine /usr/local/bin/docker-machine

# Print a message with docker-machine version
echo "Docker-Machine is done installing... "
docker-machine version
