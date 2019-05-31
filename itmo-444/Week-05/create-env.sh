#!/bin/bash

# Script to create environment

sudo apt-get -y update
sudo apt-get -y install ruby gem ruby-dev links


gem install jekyll bundler
jekyll new mysite
cd mysite
bundle exec jekyll serve --host 0.0.0.0
