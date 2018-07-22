#!/bin/bash

# Create nginx container
docker run --net host --name docker-nginx -p 80:80 -d -v /var/www:/usr/share/nginx/html:ro -v /var/nginx/conf:/etc/nginx:ro nginx

# TODO: Separate this when this works for setting up Jenkins forwarding to a port
# Enter bash for futher work
docker exec -it docker-nginx bash

# Update default.conf to forward to docker
# /etc/nginx/conf.d/default.conf 
