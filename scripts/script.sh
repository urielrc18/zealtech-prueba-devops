#!/bin/bash

# Pull the latest versions of PHP, Nginx, and MySQL images from Docker Hub
docker pull php:latest
docker pull nginx:latest
docker pull mysql:latest

export AWS_ACCESS_KEY_ID=AKIAZPZC3BZMDQIG5EVA
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-west-2
aws configure
