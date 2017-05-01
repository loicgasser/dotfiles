#!/bin/bash

# Enable Ubuntu repos
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
# Add docker repo
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

sudo apt-get update
sudo apt-get install python-pip python-dev nginx
# Install virtualenv via pip
sudo pip install virtualenv

# Docker
sudo apt-get install -y docker-engine docker-compose
#sudo systemctl status docker
# Avoid typing sudo whenever you run a docker
sudo usermod -aG docker $(whoami)

sudo ufw allow 'Nginx Full'