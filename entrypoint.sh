#!/bin/bash

# Create a lock directory
LOCK_DIR="/var/lock/squid"
mkdir -p ${LOCK_DIR}

# Function to handle file locks
acquire_lock() {
  local lock_file="$1"
  while ! ln -s $$ "${lock_file}" 2>/dev/null; do
    sleep 1
  done
}

release_lock() {
  local lock_file="$1"
  rm -f "${lock_file}"
}

# Trap exit signal to release locks
trap 'release_lock "${LOCK_DIR}/download.lock"' EXIT

# Initialize and start Squid
acquire_lock "${LOCK_DIR}/download.lock"
exec squid -N
