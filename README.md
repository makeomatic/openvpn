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
4. Create identity via `USERNAME=test ./scripts/add-client.sh`
5. transfer `./data/clients/test.ovpn` to your machine & client of choice & enjoy vpn
6. remove identity via `USERNAME=test ./scripts/remove-client.sh`
7. Transfer .ovpn configuration to your compute, example:

  ```sh
  ./scripts/transfer.sh test > ./config.ovpn
  ```

8. Install tunnelblick, for instance `brew install tunnelblick` or `brew cask install tunnelblick`
9. Install ovpn configuration on your machine, for mac its as easy as `open ./config.ovpn`
10. Adjust settings of tunnelblick:
  * checkbox [ ] proxy all ipv4 traffic
  * configuration -> advanced -> [ ] allow changes to manually-set network settings
