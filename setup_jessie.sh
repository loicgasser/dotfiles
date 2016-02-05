#!/bin/sh
adduser ltgal
apt-get update
apt-get upgrade
apt-get install software-properties-common curl
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install --yes nodejs
apt-get install --yes build-essential
apt-get install npm nodejs-legacy openjdk-7-jre gcc+ g++ htop tmux git python-virtualenv libpq-dev libgeos-dev python-dev libproj-dev make gdal-bin python-gdal gettext subversion-tools
apt-get install ruby ruby-dev
gem install travis -v 1.8.2 --no-rdoc --no-ri
