#!/bin/bash

USERNAME="newdevops"
GROUP="devops"

echo "👤 Creating user $USERNAME and adding to $GROUP group..."
sudo groupadd -f "$GROUP"
sudo useradd -m -s /bin/bash -G "$GROUP" "$USERNAME"
sudo passwd "$USERNAME"

echo "✅ User $USERNAME created successfully!"
