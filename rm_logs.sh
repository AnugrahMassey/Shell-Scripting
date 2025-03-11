#!/bin/bash

LOG_DIR="/var/log"  # Change this to your log directory
DAYS_OLD=7          # Number of days to keep logs

echo "🧹 Cleaning up log files older than $DAYS_OLD days in $LOG_DIR..."
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -f {} \;

echo "✅ Log cleanup completed!"
