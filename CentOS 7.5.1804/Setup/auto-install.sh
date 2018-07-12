#######################################################################
# Initial setup for new CentOS 7.5.1804 servers from Digitalocean.com #
#
# 1. Installs essentials
#######################################################################

# Perform initial server setup
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/01-initial-server-setup.sh)

# Create new user (optional, but highly recommended)
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/02-create-new-user.sh)

# Disable root access (optional, but highly recommended)
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/Setup/03-disable-root-access.sh)
