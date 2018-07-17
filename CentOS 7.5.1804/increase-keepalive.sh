#!/bin/bash
read -e -p "Would you like to set the server & client keepalive interval to? (15 seconds) " RESP
if [ -z "$RESP" ]; then
  RESP = 15
fi

read -e -p "Would you like to set the server's max alive count to? (5 clients) " RESP2
if [ -z "$RESP2" ]; then
  RESP2 = 5
fi

# Setup a keepalive interval for clients and the server
echo -e "\nClientAliveInterval $RESP" >> /etc/ssh/sshd_config
echo -e "\nHost *\n\tServerAliveCountMax $RESP2\n\tServerAliveInterval $RESP" >> ~/.ssh/config
echo "Keepalive interval set on both client and server side to $RESP seconds, allowing max $RESP2 clients to be connected at a time."
