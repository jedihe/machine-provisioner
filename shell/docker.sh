#!/bin/bash

# Install docker
#curl -sSL https://get.docker.io/ubuntu/ | sudo sh

# Configure user
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
