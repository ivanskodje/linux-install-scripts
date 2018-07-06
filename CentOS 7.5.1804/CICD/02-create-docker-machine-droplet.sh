#!/bin/bash
# IMPORTANT NOTES:
# - THIS WILL CREATE A NEW DROPLET ON YOUR DIGITALOCEAN SERVER!
# - BEFORE RUNNING THIS, YOU NEED TO CREATE AN API TOKEN: https://cloud.digitalocean.com/settings/api/tokens
# 
# Read more at https://linoxide.com/linux-how-to/use-docker-machine-cloud-provider/

# Create a docker-machine on digitalocean.
docker-machine create --driver digitalocean --digitalocean-access-token <TOKEN> docker01

# Connect the client to the docker engine running on host machine
eval $(docker-machine env docker01)

# Pull latest ubuntu image
docker pull ubuntu

# WIP...
