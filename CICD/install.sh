#!/bin/bash
# This is an auto installer for the CICD setup.
# This includes creating a new droplet and setting it up so that it is ready with Jenkins.
#
# Current behavior:
# 1. Create droplet from local machine
# 2. Connect to the new droplet
# 3. Perform initial server setup
#
# This is still in early Prototyping, and there may (and probably will) be issues.

# Create droplet with doctl
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/create-droplet-using-doctl.sh)

# Connect to droplet
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/connect-to-droplet.sh)

# Run initial server setup
bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Master-Server/initial-server-setup.sh)
