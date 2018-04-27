# Download the essentials (accept by default -y)
sudo apt-get install git -y

# Install Node.js v8 (recommended at April 2018)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y
nodejs -v # Prints out the version

# Setup link to node.
# This will ensure backwards compatability with scripts that still use 'node'.
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Install the package manager bower (globally with -g), using npm
sudo npm install -g bower

# Install yeoman, a generator tool
sudo npm install -g yo

# Install jhipster generator
sudo npm install -g generator-jhipster

# Done
echo "------------------------------------------------------"
echo "JHipster is ready!"
echo "Run 'yo jhipster' inside your project folder to begin."
echo "------------------------------------------------------"
