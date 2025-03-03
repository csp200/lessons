#!/bin/bash

count=1
while true; do
  echo "Loop $count in $$"
  ((count++))
  sleep 1
done
