#!/bin/sh

set -e

: "${USERNAME:?Need to set USERNAME as non-empty, for example: user\@example.com}"

# with a passphrase (recommended)
docker-compose run --rm openvpn easyrsa build-client-full $USERNAME
docker-compose run --rm openvpn ovpn_getclient $USERNAME > ./data/clients/$USERNAME.ovpn
