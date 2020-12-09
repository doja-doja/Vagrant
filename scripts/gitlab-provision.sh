#!/bin/bash
# Hier kommt Bockwurst rein
apt-get update
apt-get -y upgrade
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io 
usermod -aG docker vagrant
systemctl enable docker
