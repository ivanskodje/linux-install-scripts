# Documentation:
# https://www.infradead.org/openconnect/juniper.html
# https://github.com/russdill/juniper-vpn-py/blob/master/README.authenticator

# Install openconnect
sudo apt-get install openconnect network-manager-openconnect network-manager-openconnect-gnome -y
sudo apt --fix-broken install -y

# Go home
cd ~

# Clone juniper repo
git clone https://github.com/russdill/juniper-vpn-py
cd juniper-vpn-py

# install python dependencies
sudo apt-get install python-pip python-pycurl -y
sudo pip install mechanize netifaces pyasn1-modules urlgrabber
