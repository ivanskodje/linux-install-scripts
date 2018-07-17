#!/bin/bash
# TEST COMMANDS
#

# Start an interactive container in detached mode
CONTAINER=`docker run -d -i -t centos /bin/bash`

# Attach to container
docker attach $CONTAINER

# Install nano
yum install nano -y

# Create dummy file
echo "Testing... !!" > test.txt

# Leave container
exit

# Commit changed to new image
docker commit -a "Author Name Here" -m "Message Here" $CONTAINER someone/centos:mytag

# Create new container based on the new images
CONTAINER=`docker run -d -i -t someone/centos:mytag /bin/bash`

# View FILE diffs in the new container
# Output should be: C /test.txt
docker diff $CONTAINER
