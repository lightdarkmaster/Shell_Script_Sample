#!/bin/bash

# Function to display a notification and wait for user input
notify_and_wait() {
    message="$1"
    echo "$message"
    read -p "Press Enter to continue..."
}

# Example usage
notify_and_wait "Process started. This may take a moment."
echo "Process completed."
