#!/bin/bash

# Function to handle errors
error_handler() {
    echo "❌ Error on line $1"
}

# Trap errors
trap 'error_handler $LINENO' ERR

# Example: Trying to access a non-existent file
ls /non_existent_directory
echo "This message will not be displayed due to the error above."
