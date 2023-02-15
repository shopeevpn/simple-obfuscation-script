#!/bin/bash

# Define a function to generate a random string
generate_random_string() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# Loop through each line of the input file
while read -r line; do
  # Loop through each character of the current line
  for ((i=0; i<${#line}; i++)); do
    # Replace the current character with a random character if it's alphanumeric
    if [[ "${line:$i:1}" =~ [[:alnum:]] ]]; then
      printf "$(generate_random_string 1)"
    else
      printf "${line:$i:1}"
    fi
  done
  # Print a newline character at the end of the line
  printf "\n"
done < "$1"
