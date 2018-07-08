# Install dependency
sudo apt-get install libc++1 -y

# Get discord's deb file
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

# install discordapp
sudo dpkg -i discord.deb

# Delete the deb file
sudo rm discord.deb
