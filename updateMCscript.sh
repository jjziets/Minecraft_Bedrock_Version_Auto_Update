#!/bin/bash

# Set your Docker image
DOCKER_IMAGE="itzg/minecraft-bedrock-server:latest"

# Navigate to your docker-compose directory
cd /home/vast/mc2

# Get the image ID of the currently running image
CURRENT_IMAGE_ID=$(docker images --format "{{.ID}}" ${DOCKER_IMAGE})

# Pull the latest image
docker pull ${DOCKER_IMAGE}

# Get the image ID of the latest image
LATEST_IMAGE_ID=$(docker images --format "{{.ID}}" ${DOCKER_IMAGE})

# If the IDs don't match, the image has been updated
if [ "${CURRENT_IMAGE_ID}" != "${LATEST_IMAGE_ID}" ]; then
  docker-compose down && docker-compose up -d
fi
