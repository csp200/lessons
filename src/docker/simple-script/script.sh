#!/bin/sh

echo "Hello from inside the Docker container!"
echo -e "\nRoot directory contents:"
ls /

echo -e "\nCurrently running processes:"
ps aux
