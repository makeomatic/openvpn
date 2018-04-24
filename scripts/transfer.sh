#!/bin/sh

set -e

# populate env
source .env

# check variables
: "${OVPN_URL:?Need to set OVPN_URL as non-empty, for example: vpn.example.com}"
: "${1:?Need to set arg 1 as non-empty, for example: 'user'}"

# prepare
temporary_config=$(mktemp)
remote_dir=${remote_dir:-/opt/openvpn/data/clients}
os_username=${remote_username:-core}

# copy file to tmp location
scp "$os_username@$OVPN_URL:$remote_dir/$1.ovpn" $temporary_config
cat $temporary_config # print to stdout
rm $temporary_config # and cleanup
