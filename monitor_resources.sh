#!/bin/bash

echo "📊 Monitoring CPU & RAM Usage (Press Ctrl+C to stop)..."

while true; do
    echo "--------------------------------------"
    echo "🖥️ CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU: " $2 + $4 "%"}'
    
    echo "🛠️ RAM Usage:"
    free -h | awk '/Mem:/ {print "Used: " $3 " / Total: " $2}'
    
    sleep 5  # Update every 5 seconds
done
