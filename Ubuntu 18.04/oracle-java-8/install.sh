#!/bin/bash
# Install instructions from: https://tecadmin.net/install-oracle-java-8-ubuntu-via-ppa/

APP="Oracle Java 8"
HOMEPAGE="http://www.oracle.com"

echo "-------------------------------"
echo "INSTALLING: $APP"
echo -e "WEB-SITE: $HOMEPAGE \n\n"

echo "Installing $APP... "
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y

echo "Verifying $APP... "
sudo apt-get install oracle-java8-set-default
java -version

echo "Setting variables... "
sudo su # temporarily login as root
sudo cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-oracle
JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
EOL
exit # exit root

echo -e "$APP has finished installing.\n"
