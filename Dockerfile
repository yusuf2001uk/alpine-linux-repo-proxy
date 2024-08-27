# Use Alpine Linux as the base image
FROM alpine:latest

# Install Squid and bash
RUN apk add --no-cache squid bash

# Copy configuration and entry point script into the container
COPY proxy.conf /etc/squid/squid.conf
COPY entrypoint.sh /entrypoint.sh

# Copy the custom APK repositories list
COPY apk-repositories /etc/apk/repositories

# Set environment variables for configuration
ENV SQUID_CACHE_DIR=/var/cache/squid \
    SQUID_PORT=3128 \
    SQUID_CACHE_EXPIRY=10d \
    BANDWIDTH_LIMIT=500KB/1m

# Expose the port Squid uses
EXPOSE ${SQUID_PORT}

# Set the entry point script
ENTRYPOINT ["/entrypoint.sh"]
