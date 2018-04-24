#!/bin/sh

set -e

: "${USERNAME:?Need to set USERNAME as non-empty, for example: user\@example.com}"

docker-compose run --rm openvpn ovpn_revokeclient $USERNAME
