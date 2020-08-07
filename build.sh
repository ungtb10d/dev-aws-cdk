#!/bin/bash

# Set up environment
docker version
docker buildx ls
docker buildx create --name awsccdkbuilder
docker buildx use awscdkbuilder

echo "Building: awscdk"
    docker buildx build --platform linux/amd64,linux/arm64 -t richarvey/awscdk:latest --push .

