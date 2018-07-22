# Get discord's deb file
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

# install discordapp
sudo dpkg -i discord.deb
sudo apt-get install --fix-broken -y

# Delete the deb file
sudo rm discord.deb
