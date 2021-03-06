#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-jenkins-using-docker.sh)

# Make sure docker is available before continuing
if ! type "docker" &> /dev/null; then
  echo "You need to install docker before running this! "
  read -e -p "Do you wish to install docker (y/n) [n]? " RESP
  if [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-docker.sh)
  else
    echo "Aborting... "
    exit 1
  fi
fi

# Setup volume directory for jenkins
read -e -p "Where do you wish to store the Jenkins volume? " FOLDER_PATH
mkdir "$FOLDER_PATH"

# Make sure to add permission! By default Docker uses the 1000:1000 user.
sudo chown 1000:1000 "$FOLDER_PATH"

# Install jenkins
docker run --restart=always -d -p 18080:8080 -p 50000:50000 -v  "$FOLDER_PATH":/var/jenkins_home:z --name jenkins jenkins/jenkins
