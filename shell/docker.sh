#!/bin/bash

# Install docker
#curl -sSL https://get.docker.com | sudo sh

# Configure user
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
