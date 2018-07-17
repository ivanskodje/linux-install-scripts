#!/bin/bash
read -e -p "Do you wish to add a 2 GB SWAP to enhance performance? (Y/n) " RESP
if [ -z "$RESP" ]; then
  RESP = "y"
fi

if [ "$RESP" == "n" ] || [ "$RESP" == "N" ]; then
  echo "Skipping SWAP creation... "
  exit 1
elif [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
  # Create swap file (1024 * MB = Desired count)
  dd if=/dev/zero of=/swapfile bs=1024 count=2048000

  # Set appropriate 600 permissions
  chmod 600 /swapfile

  # Turn it into a swapfile
  mkswap /swapfile

  # Enable swapfile
  swapon /swapfile

  # Enable swapfile at boot time
  echo -e "/swapfile \tswap \tswap \tdefaults \t0 0" >> /etc/fstab

  # Confirm that swap space have been added
  free -m
fi
