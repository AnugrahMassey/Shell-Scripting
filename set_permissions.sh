#!/bin/bash

echo "🔒 Setting correct file permissions..."
chmod -R 700 /home/user/.ssh
chmod -R 755 /var/www/html
chmod -R 600 /etc/ssh/sshd_config

echo "✅ Permissions set successfully!"
