#!/bin/bash

# Get the list of directories in the current directory
directories=$(find . -type d)

# Loop through each directory
for dir in $directories; do
    # Exclude the current directory and parent directory
    if [[ $dir != "." && $dir != ".." ]]; then
        # Get the directory name
        dir_name=$(basename "$dir")
        
        # Zip the directory with its content
        zip -r "$dir_name.zip" "$dir"
    fi
done