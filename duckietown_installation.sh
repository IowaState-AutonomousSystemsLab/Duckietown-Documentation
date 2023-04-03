#!/bin/bash

sudo apt-get update --assume-yes
sudo apt install -y python3-pip git git-lfs curl wget --assume-yes
sudo apt-get remove docker docker-engine docker.io containerd runc --assume-yes
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg
sudo mkdir -m 0755 -p /etc/apt/keyrings
y | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update --assume-yes
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --assume-yes

sudo docker run hello-world
sudo adduser `whoami` docker
sudo apt-get install docker-compose

pip3 install --no-cache-dir --user -U duckietown-shell
echo 'PATH=$PATH:'$HOME'/.local/bin' >> ~/.bashrc
source ~/.bashrc
echo bash
which dts
dts --set-version daffy
