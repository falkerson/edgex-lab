#! /bin/bash

# remove old versions if exists
sudo apt-get remove docker docker-engine docker.io
# update apt repositories index
sudo apt-get update
# install packages to allow apt use repositories over HTTPS
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
# add official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# update apt index with new docker repository
sudo apt-get update
# install docker-ce (Community edition)
sudo apt-get -y install docker-ce
# start docker service
sudo systemctl enable docker


# POST isntall steps for Linux

# create docker group
#sudo groupadd docker
# add user to docker group
#sudo usermod -aG docker $USER
