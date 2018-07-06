# -- DOCKER --
# Documentation: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

# Install tools needed
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify Fingerprint
sudo apt-key fingerprint 0eBFCD88

# Add Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

# update
sudo apt-get update

# Install Docker CE
sudo apt-get install docker-ce

# Install Docker Compose
sudo apt-get install docker-compose

# Install Docker Machine
base=https://github.com/docker/machine/releases/download/v0.14.0
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
sudo install /tmp/docker-machine /usr/local/bin/docker-machine
