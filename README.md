# openvpn docker configuration

Uses https://github.com/kylemanna/docker-openvpn as underlaying container provider

## Core OS setup

For use on core os we need to do pre-setup

1. Install docker-compose

  ```sh
  sudo su -
  mkdir -p /opt/bin
  DOCKER_VER=1.21.0
  curl -L "https://github.com/docker/compose/releases/download/$(DOCKER_VER)/docker-compose-$(uname -s)-$(uname -m)" -o /opt/bin/docker-compose
  ```

2. Populate .env file with your data, sample configuration is included
3. `docker-compose up -d` - launches your service
4.
