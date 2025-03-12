#!/bin/bash

LOG_FILE="/var/log/syslog"  # Change for different logs (e.g., /var/log/auth.log)
DISK_THRESHOLD=80  # Set disk usage alert level (80%)

echo "📜 Checking logs for errors..."
grep -i "error" "$LOG_FILE" | tail -10  # Shows the last 10 errors

echo "💾 Checking disk space usage..."
df -h | awk '$5 > "'$DISK_THRESHOLD'%"{print "⚠️ High Disk Usage: "$0}'

echo "✅ Log check & disk space monitoring completed!"
