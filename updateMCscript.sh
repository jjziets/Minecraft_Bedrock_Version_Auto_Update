#!/bin/bash

# Set your Docker image
DOCKER_IMAGE="itzg/minecraft-bedrock-server:latest"

# Navigate to your docker-compose directory
cd /path/to/your/docker-compose/directory

# Set your log file
LOG_FILE="./update.log"

# Log the current date and time
echo "=============================================" >> ${LOG_FILE}
echo "$(date) - Checking for updated image" >> ${LOG_FILE}

# Get the image ID of the currently running image
CURRENT_IMAGE_ID=$(docker images --format "{{.ID}}" ${DOCKER_IMAGE})

# Pull the latest image and log the output
docker pull ${DOCKER_IMAGE} >> ${LOG_FILE} 2>&1

# Get the image ID of the latest image
LATEST_IMAGE_ID=$(docker images --format "{{.ID}}" ${DOCKER_IMAGE})

# If the IDs don't match, the image has been updated
if [ "${CURRENT_IMAGE_ID}" != "${LATEST_IMAGE_ID}" ]; then
  echo "$(date) - New image detected. Recreating containers..." >> ${LOG_FILE}
  docker-compose down >> ${LOG_FILE} 2>&1 && docker-compose up -d >> ${LOG_FILE} 2>&1
else
  echo "$(date) - No new image detected." >> ${LOG_FILE}
fi
