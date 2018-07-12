#!/bin/bash

# Install Jenkins to accept incoming connections at port 18080, using the given name "jenkins2-master".
docker run --rm -d -p 18080:8080 -p 50000:50000 --name jenkins2-master jenkins/jenkins
