#!/bin/bash

# Install
sudo apt-get install terminator -y

# Set as default Terminal
echo ">> Please enter the terminal you wish to use by default! "
sudo update-alternatives --config x-terminal-emulator
