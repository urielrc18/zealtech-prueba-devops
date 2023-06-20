#!/bin/bash

# Pull the latest versions of PHP, Nginx, and MySQL images from Docker Hub
docker pull php:latest
docker pull nginx:latest
docker pull mysql:latest


aws configure
AWS Access Key ID [None]: AKIAZPZC3BZMDQIG5EVA
AWS Secret Access Key [None]: 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
Default region name [None]: us-west-2
Default output format [None]: json
