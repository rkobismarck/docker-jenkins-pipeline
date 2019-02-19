#!/bin/bash
echo "Let's stat with updating the repository."
sudo yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo "Updated repository."

sudo systemctl start docker
sudo docker ps

echo "We've finished installing docker ce.Let's continue with portainer."

echo "Creation of the directory for the data on Portainer:"
sudo docker volume create portainer_data
echo "Let's start with Portainer:"
sudo docker run -d --restart unless-stopped -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
