# Introduction

Docker image for Thule Linux based on Debian

# Setup

Install docker:
```
curl -sSL https://get.docker.com | sh
```

Install docker-compose:

Latest: v2.12.2

Installation command:
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Provide correct permissions to docker compose:
```
$ sudo chmod +x /usr/local/bin/docker-compose
```

Test docker-compose:
```
$ docker-compose --version
```

# Usage

Create a `docker-compose.yml` and map the workspace directory into /workspace:

```
# Docker composer file for Thule Linux
version: '3.8'
services:
  thule-linux:
    image: "ghcr.io/fvincenzo/thule-linux:latest"
    container_name: "thule-linux"
    environment:
      - UID=1000
      - GID=1000
    volumes:
      - ./workspace:/workspace
      - ~/.ssh:/home/1000/.ssh
      - ~/.gitconfig:/home/1000/.gitconfig
    tty: true
```

Then, bring up the container:
```
docker-compose up -d
```

To build the Thule Linux image, login into the container as user with id '1000':

```
docker exec -it -u 1000 thule-linux /bin/bash
```