#!/bin/bash

USER_HOME="/home/user"

echo "🔑 Generating SSH keys..."
ssh-keygen -t rsa -b 4096 -f "$USER_HOME/.ssh/id_rsa" -N ""

echo "📂 Copying public key to authorized_keys..."
cat "$USER_HOME/.ssh/id_rsa.pub" >> "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"

echo "✅ SSH setup complete!"
