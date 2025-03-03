#!/bin/bash

handler() {
  echo 'Haha!'
}

trap handler SIGINT
# trap handler SIGTERM # uncomment to ignore default kill

count=1
while true; do
  echo "Loop $count in $$"
  ((count++))
  sleep 1
done
