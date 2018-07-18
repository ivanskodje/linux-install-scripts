#!/bin/bash
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-jenkins-using-docker.sh)

# Make sure docker is available before continuing
if ! type "docker" &> /dev/null; then
  echo "You need to install docker before running this! "
  read -e -p "Do you wish to install docker (y/n) [n]? "
  if [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-docker.sh)
  else
    echo "Aborting... "
    exit 1
  fi
fi

#####################
# TODO: Work in progress. Does not work as expected (port is not available at this stage)
#
# Install Jenkins to accept incoming connections at port 18080, using the given name "jenkins2-master".
# docker run --restart=always -d -p 127.0.0.1:18080:8080 -p 50000:50000 -v  /var/jenkins_home:/var/jenkins_home:z --name jenkins jenkins/jenkins
#docker run -d -v /var/jenkins_home:/var/jenkins_home:z -p 8080:8080 -p 50000:50000 --name myjenkins jenkins/jenkins:lts


# docker run -u root --restart:always -d -p 18080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
