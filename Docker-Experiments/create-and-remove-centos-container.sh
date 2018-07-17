#!/bin/bash
# This file exists in order to become familiar with basic docker commands involved in setting up a container.
# TEST COMMANDS
#

# Get image
docker pull centos

# List image to confirm
docker images

# Start an interactive container in detached mode
CONTAINER=`docker run -d -i -t centos /bin/bash`

# Attach to container
docker attach $CONTAINER

# Install nano
yum install nano -y

# Create dummy file
echo "Testing... " > test.txt

# Leave container
exit

# Stop container
docker stop $CONTAINER

# Delete container
docker rm $CONTAINER
