#!/bin/bash

# Threshold values (Adjust as per your requirement)
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=80
LOG_FILE="resource_alert.log"
ALERT_EMAIL="your-email@example.com"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a $LOG_FILE
}

# Function to check CPU usage
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
    if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
        log_message "⚠️ CPU usage is at ${CPU_USAGE}%, exceeding the threshold of ${CPU_THRESHOLD}%."
        send_alert "CPU usage is high: ${CPU_USAGE}%"
    fi
}

# Function to check RAM usage
check_ram() {
    RAM_USAGE=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
    if [ "$RAM_USAGE" -ge "$RAM_THRESHOLD" ]; then
        log_message "⚠️ RAM usage is at ${RAM_USAGE}%, exceeding the threshold of ${RAM_THRESHOLD}%."
        send_alert "RAM usage is high: ${RAM_USAGE}%"
    fi
}

# Function to check Disk usage
check_disk() {
    DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
        log_message "⚠️ Disk usage is at ${DISK_USAGE}%, exceeding the threshold of ${DISK_THRESHOLD}%."
        send_alert "Disk usage is high: ${DISK_USAGE}%"
    fi
}

# Function to send alerts (Optional)
send_alert() {
    if command -v mail &> /dev/null; then
        echo "Alert: $1" | mail -s "Resource Alert Notification" $ALERT_EMAIL
        log_message "📧 Alert sent to $ALERT_EMAIL"
    else
        log_message "⚠️ Email alert failed. 'mail' command not found."
    fi
}

# Run checks
check_cpu
check_ram
check_disk

log_message "✅ Resource check completed."
