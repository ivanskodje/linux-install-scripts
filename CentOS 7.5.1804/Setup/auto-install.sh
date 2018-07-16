#######################################################################
# Initial setup for new CentOS 7.5.1804 servers from Digitalocean.com #
#
# Before running any scripts, we make sure our system is up to date.
# 1. Installs essentials.
# 2. Setup keepalive to prevent getting disconnected after being idle for a short time.
# 3. Create SWAP space
# 4. Create new SUDO user
#######################################################################

# Update system
sudo yum update -y && sudo yum upgrade -y

# 1. Install essentials
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/install-essentials.sh)

# 2. Setup keepalive interval
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/increase-keepalive.sh)

# 3. Create SWAP space
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/create-swap.sh)

# 4. Create new sudo user
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/create-new-sudo-user.sh)

# Disable root access (optional, but highly recommended)
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/disable-root-access.sh)
