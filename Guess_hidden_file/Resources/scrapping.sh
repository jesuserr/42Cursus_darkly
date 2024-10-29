#!/bin/bash

# Base URL to start downloading from
BASE_URL="http://192.168.56.101/.hidden/"

# Local directory to save the downloaded content
LOCAL_DIR="./downloaded_content/"

# Create the local directory if it doesn't exist
mkdir -p "$LOCAL_DIR"

# Use wget to download the content recursively with infinite depth and other necessary options
wget --recursive --no-parent --directory-prefix="$LOCAL_DIR" --execute robots=off --reject "index.html*" "$BASE_URL" > /dev/null 2>&1

# Find a file containing a number and print its content
# Searching for 'flag' instead of '[0-9]' would work too
file=$(find "$LOCAL_DIR" -type f -exec grep -l '[0-9]' {} + | head -n 1)
cat "$file"

rm -rf "$LOCAL_DIR"