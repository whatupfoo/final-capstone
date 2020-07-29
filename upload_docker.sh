#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=blue

# Step 2:
# Authenticate & tag
docker login -u rwnfoo
docker system info | grep Registry
echo "Docker ID and Image: $dockerpath"
docker tag $dockerpath rwnfoo/$dockerpath

# Step 3:
# Push image to a docker repository
docker push rwnfoo/$dockerpath