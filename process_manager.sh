#!/bin/bash

echo "🔍 Listing all running processes..."
ps aux --sort=-%cpu | head -10  # Shows top 10 CPU-intensive processes

echo "Enter the PID of the process you want to kill (or press Enter to skip):"
read PID

if [[ -n "$PID" ]]; then
    kill -9 "$PID"
    echo "✅ Process $PID has been terminated!"
else
    echo "⚠️ No process was selected."
fi
