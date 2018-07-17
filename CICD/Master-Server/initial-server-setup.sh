#######################################################################
# Initial setup for new CentOS 7.5.1804 servers from Digitalocean.com #
# This runs ON the created machine that will handle CICD.
#
# TO RUN THIS SCRIPT:
# yum install curl -y
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Master-Server/initial-server-setup.sh)
#
# Before running any scripts, we make sure our system is up to date.
# 1. Installs essentials.
# 2. Setup keepalive to prevent getting disconnected after being idle for a short time.
# 3. Create SWAP space
# 4. Create new SUDO user
# 5. Disable root access
# 6. Install docker and ansible
#######################################################################

# Update system
sudo yum update -y && sudo yum upgrade -y

# 1. Install essentials
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-essentials.sh)

# 2. Setup keepalive interval
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/increase-keepalive.sh)

# 3. Create SWAP space
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/create-swap.sh)

# 4. Create new sudo user
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/create-new-sudo-user.sh)

# 5. Disable root access
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/disable-root-access.sh)

# 6. Install docker
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-docker.sh)
