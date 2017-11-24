#!/bin/sh

RENEW=${RENEW:-"false"}
DOMAIN=${DOMAIN:-''}
EMAIL=${EMAIL:-''}

if [ -z "$DOMAIN" ]; then
  echo "DOMAIN must be set"; exit 1
fi

if [ -z "$EMAIL" ]; then
  echo "EMAIL must be set"; exit 1
fi

if [ "$RENEW" = "true" ]; then
  certbot renew
else
  certbot certonly \
    --verbose \
    --noninteractive \
    --quiet \
    --standalone \
    --agree-tos \
    --no-eff-email \
    --email="${EMAIL}" \
    --domains="${DOMAIN}"
fi
