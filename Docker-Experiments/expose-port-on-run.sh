#!/bin/bash
# TEST COMMANDS
#

# Will create a centos container that exposes port 22
CONTAINER=`docker run --expose=22 -d -i -t centos /bin/bash`
