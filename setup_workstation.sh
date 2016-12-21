#!/bin/bash

sudo apt-get update
sudo apt-get install -y git

cd ~
git clone https://github.com/chef/chef-repo.git

cd /tmp
wget https://packages.chef.io/files/stable/chefdk/1.1.16/ubuntu/16.04/chefdk_1.1.16-1_amd64.deb
sudo dpkg -i chefdk_1.1.16-1_amd64.deb && rm chefdk_1.1.16-1_amd64.deb

chef verify

#use Chef Ruby version and restart your terminal
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile

