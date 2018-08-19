#!/bin/bash
# Ubuntu / Kubuntu tested

# Download the essentials
sudo apt-get install git -y

# Install Node.js v8 (recommended at April 2018)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y
nodejs -v # Prints out the version

# Install yarn (for running web server, viewing live changes++)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

# Install the package manager bower (globally with -g), using npm
sudo npm install -g bower

# Install yeoman, a generator tool
sudo npm install -g yo

# Install jhipster generator
sudo npm install -g generator-jhipster

# Done
echo "------------------------------------------------------"
echo "JHipster is ready!"
echo "Run 'jhipster' inside your project folder to begin."
echo "------------------------------------------------------"
