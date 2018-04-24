#!/bin/sh

set -e

: "${USERNAME:?Need to set USERNAME as non-empty, for example: user\@example.com}"

docker exec ovpn ovpn_revokeclient $USERNAME
