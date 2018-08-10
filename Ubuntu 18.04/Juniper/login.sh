# Run script
read -e -p "Please enter your username: " USERNAME
read -e -p "Please enter the host (vpn.host.com): " HOST
./juniper-vpn.py --host $HOST --username $USERNAME --stdin DSID=%DSID% openconnect --juniper %HOST% --cookie-on-stdin
