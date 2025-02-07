#! /bin/bash
 
# variable assignment
greeting="hello"

# variable interpolation (aka parameter expansion)
echo "$greeting world"
echo "${greeting}!!!"

# command substitution
today=$(date) 
echo "Today's date is $today"

# arithmetic 
val=10
((val+=5))
echo "$val"
echo "1MB is $((2**20)) bytes"

# get user input
read -p "Enter your name: " username
echo "Hello, $username"

# conditionals
if [ "$username" == "Michael" ]; then
  echo "Welcome back, sir!"
elif [ "$username" == "Jane" ]; then
  echo "Welcome back, ma'am!"
else
  echo "Who are you?"
fi

# file-based tests
if [ -f "script.sh" ]; then
  echo "script.sh exists!"
else
  echo "script.sh doesn't exist!"
fi

# numerical tests
read -p "Enter your age: " age
if [ $age -ge 18 ]; then
  echo "You are an adult!"
else
  echo "You are a child!"
fi

# filename expansion and iteration
for file in *; do
  echo "Processing file $file"
done

# general purpose looping
count=1
while [ $count -le 5 ]; do
  echo "Count = $count"
  ((count++))
done

# reading lines from a file
filename="/etc/passwd"
count=0
while read line && [ $count -lt 5 ]; do
  echo "Read '${line}'"
  ((count++))
done < $filename

# accessing command line arguments
echo "All arguments $@"
echo "Argument 0: $0"
echo "Argument 1: $1"
echo "Argument 2: $2"

for arg in "$@"; do
  echo "Argument: $arg"
done

count=0
while [ $count -le $# ]; do
  echo "Argument $count: ${!count}"
  ((count++))
done

# defining functions
countdown() {
  local n=$1 # funtion args available in $1, $2, etc.
  while [ $n -ge 0 ]; do
    echo "$n"
    ((n--))
  done
  echo "Boom!"
}

countdown 10
