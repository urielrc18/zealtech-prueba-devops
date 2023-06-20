#!/bin/bash

# Pull the latest versions of PHP, Nginx, and MySQL images from Docker Hub
docker pull php:latest
docker pull nginx:latest
docker pull mysql:latest

sudo apt update && sudo apt install software-properties-common gnupg2 curl
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform
terraform --version 
pwd