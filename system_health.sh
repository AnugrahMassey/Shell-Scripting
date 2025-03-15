#!/bin/bash
echo "📊 System Health Check - $(date)"
echo "----------------------------------"

echo "🖥️ CPU Usage:"
top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4"% CPU usage"}'

echo "💾 RAM Usage:"
free -h | awk '/Mem:/ {print "Used: " $3 ", Free: " $4}'

echo "📀 Disk Usage:"
df -h | awk '$NF=="/"{print "Used: " $3 ", Available: " $4}'

echo "🔍 Active Processes (Top 5 by CPU Usage):"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

echo "✅ System health check completed."
