#!/bin/bash

# Pull the latest versions of PHP, Nginx, and MySQL images from Docker Hub
docker pull php:latest
docker pull nginx:latest
docker pull mysql:latest

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

aws configure
AWS Access Key ID [None]: AKIAZPZC3BZMDQIG5EVA
AWS Secret Access Key [None]: 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
Default region name [None]: us-west-2
Default output format [None]: json
