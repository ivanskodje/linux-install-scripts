#!/bin/bash
# This is an interactive installer for all the CICD scripts.
#
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/install.sh)
#
#
# Current behavior:
# 1. Create droplet from local machine
# 2. Connect to the new droplet
# 3. Perform initial server setup on the droplet
#
# This is still in early Prototyping, and there may (and probably will) be issues.

# Create droplet with doctl
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/create-droplet-using-doctl.sh)

# Connect to droplet
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/connect-to-droplet.sh)

# Run initial server setup
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Master-Server/initial-server-setup.sh)
