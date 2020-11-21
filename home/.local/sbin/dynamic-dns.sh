#!/bin/bash

API_ACCESS_TOKEN="$(cat "$HOME/.local/etc/dynamic-dns.api-key")"

echo $API_ACCESS_TOKEN

PUBLIC_IPV4=$(curl ifconfig.co)
DIGITALOCEAN_DOMAIN="johnmaguire.me"
DIGITALOCEAN_RECORD_ID="26269093"

echo "Setting to ${PUBLIC_IPV4}"

curl -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer ${API_ACCESS_TOKEN}" -d '{"data":"'"${PUBLIC_IPV4}"'"}' "https://api.digitalocean.com/v2/domains/${DIGITALOCEAN_DOMAIN}/records/${DIGITALOCEAN_RECORD_ID}"
