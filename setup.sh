#!/bin/sh

# Ensure environment variables are set
: "${SQUID_CACHE_DIR:=/var/cache/squid}"
: "${SQUID_PORT:=3128}"
: "${SQUID_CACHE_EXPIRY:=10d}"
: "${BANDWIDTH_LIMIT:=500KB/1m}"

# Export the variables
export SQUID_CACHE_DIR
export SQUID_PORT
export SQUID_CACHE_EXPIRY
export BANDWIDTH_LIMIT

# Start Docker Compose
docker-compose up --build -d
