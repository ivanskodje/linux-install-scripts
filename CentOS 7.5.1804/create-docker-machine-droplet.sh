#!/bin/bash
# IMPORTANT NOTES:
# - BEFORE RUNNING THIS, YOU NEED TO CREATE AN API TOKEN: https://cloud.digitalocean.com/settings/api/tokens
# - THIS WILL CREATE A NEW DROPLET ON YOUR DIGITALOCEAN SERVER!
#
# Read more at https://linoxide.com/linux-how-to/use-docker-machine-cloud-provider/

# Create a docker-machine on digitalocean.
# docker-machine create --driver digitalocean --digitalocean-access-token <TOKEN> <machine-name>

# Prints the variables needed to connect to the machine. It will tell you what to do, which is the eval line below.
# docker-machine env docker01

# Setup the variables needed to connect to the machine via SSH, using docker-machine ssh docker01
# eval $(docker-machine env <machine-name>)

# Pull latest ubuntu image for later use
# docker pull ubuntu

#
