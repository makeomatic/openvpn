#!/bin/sh

set -e

: "${USERNAME:?Need to set USERNAME as non-empty, for example: user\@example.com}"

# with a passphrase (recommended)
docker exec openvpn easyrsa build-client-full $USERNAME
docker exec openvpn ovpn_getclient $USERNAME > ./data/clients/$USERNAME.ovpn
