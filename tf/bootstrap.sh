#!/bin/bash

set -x

################################################################################
# GLOBAL VARS

################################################################################
# UPGRADE AND INSTALL STUFF

# make sure everything is up to date
sudo yum -y update
sudo yum -y upgrade

# handy stuff that I want to have for troubleshooting
sudo yum -y install vim tree lsof

# install go
sudo yum -y install epel-release
sudo yum -y install go

################################################################################
# CONFIGURE AND START DOCKER

echo "heyo boyo"

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo yum install -y docker-compose
sudo systemctl start docker

# add users to docker group
sudo groupadd docker
sudo usermod -aG docker centos


echo "HEYO BOYO! I picked meself up by me bootstraps!"
