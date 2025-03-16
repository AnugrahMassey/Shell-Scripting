#!/bin/bash

# Log file for error tracking
LOG_FILE="script.log"

# Function to log messages
log_message() {
    local MESSAGE=$1
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $MESSAGE" | tee -a $LOG_FILE
}

# Function to check if a directory exists
check_directory() {
    local DIR=$1
    if [ -d "$DIR" ]; then
        log_message "✅ Directory '$DIR' exists."
    else
        log_message "❌ ERROR: Directory '$DIR' does not exist."
        return 1  # Return error code
    fi
}

# Function to create a backup of a file
backup_file() {
    local FILE=$1
    if [ -f "$FILE" ]; then
        cp "$FILE" "$FILE.bak"
        log_message "📦 Backup created for '$FILE'."
    else
        log_message "❌ ERROR: File '$FILE' not found!"
        return 1
    fi
}

# Error handling: Capture errors and execute cleanup
trap 'log_message "🚨 Script interrupted! Cleaning up..."; exit 1' SIGINT SIGTERM

# Main script execution
log_message "🚀 Script started."

# Check a directory (Modify the path as needed)
check_directory "/etc"

# Backup a sample file (Modify filename)
backup_file "/var/log/syslog"

log_message "✅ Script execution completed."
exit 0
