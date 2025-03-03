#!/bin/bash

handler() {
  echo 'Haha!'
}

trap handler SIGINT
# trap handler SIGTERM # uncomment to ignore default kill

count=1
while true; do
  echo "Loop $count in $$" # $$ is a special variable that holds my PID
  ((count++))
  sleep 1
done
