#!/bin/bash

THRESHOLD=80  # Disk usage percentage threshold
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "📊 Checking disk space usage..."
echo "Current disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
  echo "🚨 Warning: Disk usage is above $THRESHOLD%! Consider cleaning up space."
else
  echo "✅ Disk usage is within safe limits."
fi
