#!/bin/bash
THRESHOLD=100M
DIRECTORY=${1:-"/"}

echo "🔍 Searching for files larger than $THRESHOLD in $DIRECTORY..."
find $DIRECTORY -type f -size +$THRESHOLD -exec ls -lh {} + | awk '{print $9 ": " $5}'

echo "✅ Search completed."
