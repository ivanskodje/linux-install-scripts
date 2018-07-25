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
sudo apt-get install python-pip -y
sudo pip install mechanize netifaces pycurl pyasn1-modules urlgrabber
# sudo apt-get install python-pycurl # (This might not be needed)

# Login as root
sudo su

# Run script
read -e -p "Please enter your username: " USERNAME
read -e -p "Please enter the host (vpn.host.com): " HOST
juniper-vpn.py --host $HOST --username $USERNAME --stdin DSID=%DSID% openconnect --juniper %HOST% --cookie-on-stdin
