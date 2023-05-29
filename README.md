# Dockerized Minecraft Bedrock Server

This project sets up a Dockerized Minecraft Bedrock server, allowing you to run a Minecraft server inside a Docker container. It includes a script to update the Docker image and recreate the server containers automatically when a new version of the image is available.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository to your server.
2. Navigate to the project directory.
3. Edit the docker-compose.yml and replace the values in the environment sections with the settings you prefer for your Minecraft servers. The example docker-compose.yml will setup two minecraft servers, Survival Server on port 19132 and creative on port 19133
4. You need to create these volumes before running the docker-compose command.
```
bash
Copy code
docker volume create survival-data
docker volume create creative-data

docker run --rm -v survival-data:/data alpine chown 1000:1000 /data
docker run --rm -v creative-data:/data alpine chown 1000:1000 /data
```

5. Run `docker-compose up -d` to start the server containers.


## Update Script

The `updateMCscript.sh` script checks for updates to the Minecraft Bedrock server Docker image. If a new version is found, the script will pull the updated image, recreate the server containers with the new image, and log the operation.

### Usage

You can run the script manually with the command `./updateMCscript.sh`.

You can also set up a cron job to run the script automatically. To have the script run every day at midnight, for example, you could add the following line to your crontab:

```
0 0 * * * /path/to/updateMCscript.sh
```

Replace `/path/to/` with the path to the directory where `updateMCscript.sh` is located.

### Logs

The `updateMCscript.sh` script logs its operations to a file named `update.log` located in the same directory as the script. The log includes the date and time of each operation and the result (whether the Docker image was updated and the server containers were recreated).

## More Information

For more details on Docker, see the [official Docker documentation](https://docs.docker.com/).

For more details on the Minecraft Bedrock server, see the [official Minecraft Bedrock server documentation](https://minecraft.net/en-us/download/server/bedrock/).

Please note that this project is not affiliated with or endorsed by Docker, Inc. or Mojang Synergies AB.
