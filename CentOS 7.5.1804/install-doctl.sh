#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-doctl.sh)
#
# Install doct on Linux. Check https://github.com/digitalocean/doctl/releases for specific releases.

read -e -p "Do you use a 64bit AMD or an 32/64bit Intel computer? (INTEL/amd)" RESP
if [ -z "$RESP" ]; then
  RESP="Intel"
fi

DOWNLOAD_URL="https://github.com/digitalocean/doctl/releases/download/v1.8.3/doctl-1.8.3-linux-amd64.tar.gz"
if [ "$RESP" == "intel" ] || [ "$RESP" == "Intel" ] || [ "$RESP" == "INTEL" ]; then
  DOWNLOAD_URL="https://github.com/digitalocean/doctl/releases/download/v1.8.3/doctl-1.8.3-linux-amd64.tar.gz"
elif [ "$RESP" == "amd" ] || [ "$RESP" == "Amd" ] || [ "$RESP" == "AMD" ]; then
  DOWNLOAD_URL="https://github.com/digitalocean/doctl/releases/download/v1.8.3/doctl-1.8.3-linux-386.tar.gz"
else
  echo "No valid input given. Cancelling installation of Doctl... "
  exit 1
fi

# Download file
echo "Commencing with download... "
cd ~
sudo wget "$DOWNLOAD_URL" --no-check-certificate -O "doctl.tar.gz"

# Extract file
echo "Extracting file... "
sudo tar -zxvf ~/doctl.tar.gz

echo "Cleaing up... "
sudo rm ~/doctl.tar.gz

# Move file to bin so that it may be accessed from anywhere
echo "Moving file to /usr/local/bin for ease of access..."
sudo mv ~/doctl /usr/local/bin
