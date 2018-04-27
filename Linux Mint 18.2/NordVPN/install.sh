sudo apt-get install network-manager-openvpn-gnome
sudo service network-manager restart
sudo apt-get install openvpn
cd /etc/openvpn
sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
sudo apt-get install unzip -y
sudo unzip ovpn.zip
sudo rm ovpn.zip
#cd ovpn_udp
cd ovpn_tcp
ls -al
echo 'Select the TCP server to connect... Alternatively import it using the Network Manager as VPN!'


