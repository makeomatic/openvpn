#!/bin/sh

set -e

: "${OVPN_URL:?Need to set OVPN_URL as non-empty, for example: vpn.example.com}"
: "${OVPN_PROTO:?Need to set OVPN_PROTO to 'udp' or 'tcp'}"

# prepare configuration if it doesn't already exist
if [ ! -f /etc/openvpn/openvpn.conf ]; then
  ovpn_genconfig -u "$OVPN_PROTO://$OVPN_URL" -n 1.1.1.1 -n 1.0.0.1
fi

if [ ! -f /etc/openvpn/pki/private/$OVPN_URL.key ]; then
  EASYRSA_BATCH=1 EASYRSA_REQ_CN=$OVPN_URL ovpn_initpki nopass
fi

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ] || [ ! -x "$1" ]; then
	set -- ovpn_run "$@"
fi

exec "$@" --proto $OVPN_PROTO
