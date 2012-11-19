#!/bin/bash

host="${1:-ubuntu@ec2-54-247-25-8.eu-west-1.compute.amazonaws.com}"
ssh-keygen -R "${host#*@}" 2> /dev/null

scp -i ~/.ssh/app.pem -r config/puppet $host:/home/ubuntu/
ssh -i ~/.ssh/app.pem "$host" '
sudo apt-get update
sudo apt-get install -y libyaml-dev
sudo apt-get install -y curl git-core bzip2 build-essential zlib1g-dev libssl-dev
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libapr1-dev
sudo apt-get install -y libaprutil1-dev 
sudo apt-get install -y libreadline-dev
sudo apt-get install -y build-essential openssl libreadline6 libreadline6-dev
sudo apt-get install -y apache2-prefork-dev
sudo apt-get -y install ruby1.9.3
sudo gem install puppet --no-ri --no-rdoc
sudo gem install rails --no-ri --no-rdoc
sudo useradd --comment "Puppet" --no-create-home --system --shell /bin/false puppet
sudo rm -rf /etc/puppet
sudo cp -r ~/puppet /etc/ && rm -rf ~/puppet'