#!/bin/bash
# TEST COMMANDS
#

# Run a Centos image with a restart policy to try to restart up to 3 times on failure
CONTAINER=`docker run --restart=on-failure:3 -d -i -t centos /bin/bash`

# Will always restart no matter the reason it stopped/failed
CONTAINER=`docker run --restart=always -d -i -t centos /bin/bash`

# Will not restart if it fails or stops for any reason
CONTAINER=`docker run --restart=no -d -i -t centos /bin/bash`
