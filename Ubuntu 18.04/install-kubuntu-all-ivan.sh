#!/bin/bash
# Custom install for Ivanskodje during fresh Kubuntu install with everything selected during install.

# Install Curl
sudo apt-get install curl -y

# Install Atom
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/Atom/install.sh)

# Install Git
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/Git/install.sh)

# Create development folder
mkdir ~/development
cd ~/development

# Clone scripts
git clone https://github.com/ivanskodje/linux-install-scripts.git

# Open in Atom (for further editing)
atom linux-install-scripts

read -e -p "Waiting for you to install ATOM plugins (git-plus, diff, markdown, ...)... " Waiting

# Install Chrome
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/Chrome/install.sh)

# Install KeePass2 with plugins for both FIreFox and Chrome
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/KeePass2/install.sh)

# Install MegaSync
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/MegaSync/install.sh)

# Install Slack
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/Slack/install.sh)

# Install VeraCrypt
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/VeraCrypt/install.sh)

# Install Juniper
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/Juniper/install.sh)

# Install Java 8 # TODO: Fix this so that no manual work is required
bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/Ubuntu%2018.04/oracle-java-8/install.sh)
