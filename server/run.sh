#!/bin/bash

# Check if rabbit is up and running before starting the service.

RABBIT_USER=guest
RABBIT_PASSWORD=guest
RABBIT_HOST=localhost
RABBIT_MANAGEMENT_PORT=15672

is_ready() {
    eval "curl -I http://${RABBIT_USER:guest}:${RABBIT_PASSWORD:guest}@${RABBIT_HOST:localhost}:${RABBIT_MANAGEMENT_PORT}/api/vhosts" > /dev/null
}

i=0
while ! is_ready; do
    i=`expr $i + 1`
    if [ $i -ge 10 ]; then
        echo "$(date) - rabbit still not ready, giving up"
        exit 1
    fi
    echo "$(date) - waiting for rabbit to be ready"
    sleep 3
done

nameko run mathserv.service --backdoor 3000