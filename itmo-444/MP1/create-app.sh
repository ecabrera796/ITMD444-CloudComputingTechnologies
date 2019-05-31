#!/bin/bash

# Script to create environment

sudo apt-get -y update
sudo apt-get install -y apache2 git
sudo apt-get -y install ruby gem ruby-dev links

cd /var/www/html
sudo git clone https://github.com/illinoistech-itm/ecabrer2
