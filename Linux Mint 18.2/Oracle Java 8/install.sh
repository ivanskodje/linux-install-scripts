# Install Oracle Java-8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install java-common oracle-java8-installer

# Set as default
sudo apt-get install oracle-java8-set-default
cat /etc/profile.d/jdk.sh

# Reload sources
source /etc/profile

# Confirm that it works
echo $JAVA_HOME
