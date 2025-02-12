#!/bin/bash

handler() {
  echo 'Haha!'
}

trap handler SIGINT
# trap handler SIGTERM # uncomment to ignore default kill

while true; do
  echo "Looping..."
  sleep 1
done
