# rpi-server
Node.js server hosted in a Docker container configured on a Raspberry Pi3

## Getting started
* Clone this repo: https://github.com/ezhai24/rpi-server.git
* Start the containers
```
docker-compose up -d
```

## How it was built
### Create and Dockerize a Basic Node.js App
* Follow this step by step tutorial: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
**Note: ** The image must be built from `arm32v7/node` the official node Docker image for Raspberry Pi3's architecture

### Pydio
"Pydio is like Google Drive for your personal cloud."
* Pull the image
```
docker pull jordancrawford/rpi-pydio-docker
```
* Start a container
```
docker run -it --name pydio -d -p 80:80 -p 443:443 jordancrawford/rpi-pydio-docker
```

### Watchtower
Watchtower monitors your running Docker containers and watches for changes to the images that those containers were originally started from. If watchtower detects that an image has changed, it will automatically restart the container using the new image.
* Pull the ARM compatible image
```
docker pull v2tec/watchtower:armhf-latest
```
* Start a container
```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  v2tec/watchtower
```

### Docker Compose
"Compose is a tool for defining and running multi-container Docker applications."
* Install `docker-compose`
```
# Uncomment if pip is not already installed
# sudo apt-get install python-pip

sudo pip install docker-compose
```
* Create a `docker-compose.yml` file in the project's working directory
  * Getting started: https://docs.docker.com/compose/gettingstarted/
  * Version 3 Reference: https://docs.docker.com/compose/compose-file/
