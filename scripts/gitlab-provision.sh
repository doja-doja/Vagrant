#!/bin/bash
# Hier kommt Bockwurst rein
# Shebang #! bei unixoiden Systemen: das nachfolgende Kommando wird beim Aufruf dieses Programms ausgeführt
# also werden die folgenden Kommandos auf der Bash ausgeführt
apt-get update
apt-get -y upgrade
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# apt-transport-https: prior to version 1.5, APT did not support download via https (only http)
# ca-certificates: in diesem Paket sind einige CA-Zertifikate seriöser CAs enthalten
# curl: a command-line utility for transferring data from or to a remote server
# gnupg-agent: Paket ermöglicht automatische Passworteingabe aus dem Cache
# software-properties-common: 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# fügt für docker einen neuen Key zur Schlüsselverwaltung hinzu
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" # Docker-Repo ins source-file eintragen
apt-get update # nach neuster Docker-Version schauen
apt-get -y install docker-ce docker-ce-cli containerd.io 
# docker community edition samt CLI installieren, containerd.io ist eine container runtime
usermod -aG docker vagrant
systemctl enable docker
