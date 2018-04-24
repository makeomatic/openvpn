#!/bin/sh

set -e

: "${USERNAME:?Need to set USERNAME as non-empty, for example: user\@example.com}"

# with a passphrase (recommended)
docker exec -it ovpn easyrsa build-client-full $USERNAME
docker exec ovpn ovpn_getclient $USERNAME > ./data/clients/$USERNAME.ovpn
