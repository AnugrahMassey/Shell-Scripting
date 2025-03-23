#!/bin/bash

# Check if a new hostname is provided
if [ -z "$1" ]; then
    echo "❗ Usage: $0 <new_hostname>"
    exit 1
fi

NEW_HOSTNAME=$1

echo "=============================="
echo "🔧 Updating Hostname to: $NEW_HOSTNAME"
echo "=============================="

# Update hostname temporarily
sudo hostnamectl set-hostname $NEW_HOSTNAME
echo "✅ Temporary hostname updated."

# Update /etc/hostname
echo $NEW_HOSTNAME | sudo tee /etc/hostname
echo "✅ /etc/hostname updated."

# Update /etc/hosts
sudo sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/" /etc/hosts
echo "✅ /etc/hosts updated."

# Verify the update
echo "🔎 Verifying new hostname..."
hostnamectl status
