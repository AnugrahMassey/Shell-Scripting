#!/bin/bash

# Process Management Script

echo "🔎 Process Management Menu"
echo "1. View running processes"
echo "2. Search for a process by name"
echo "3. Kill a process by PID"
echo "4. Exit"
read -p "Choose an option (1-4): " choice

case $choice in
  1)
    echo "📋 Displaying all running processes..."
    ps aux
    ;;
  2)
    read -p "Enter the process name to search: " pname
    echo "🔍 Searching for processes matching '$pname'..."
    pgrep -laf "$pname" || echo "❗ No matching processes found."
    ;;
  3)
    read -p "Enter the PID of the process to kill: " pid
    if kill -9 "$pid" 2>/dev/null; then
      echo "✅ Process with PID $pid has been terminated."
    else
      echo "❗ Failed to terminate process. Check the PID and try again."
    fi
    ;;
  4)
    echo "🚪 Exiting script."
    exit 0
    ;;
  *)
    echo "❗ Invalid choice. Please select a valid option."
    ;;
esac
