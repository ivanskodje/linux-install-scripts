# Install KeePass 2.x for Linux
sudo apt-add-repository ppa:jtaylor/keepass
sudo apt-get update
sudo apt-get install keepass2

# Install Mono (in order to use browser addon)
sudo apt-get install mono-complete

# In order to view the icon in the tray
sudo apt-add-repository ppa:dlech/keepass2-plugins
sudo apt-get update
sudo apt-get install keepass2-plugin-application-indicator
