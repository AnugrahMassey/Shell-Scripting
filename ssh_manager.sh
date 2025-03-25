#!/bin/bash

# SSH Manager Script

echo "SSH Manager Script"
echo "1. Connect to a server"
echo "2. Copy SSH key to a server"
echo "3. Test SSH connection"
echo "4. Exit"

read -p "Select an option (1-4): " choice

case $choice in
  1)
    read -p "Enter username: " username
    read -p "Enter server IP or hostname: " server
    ssh $username@$server
    ;;
  
  2)
    read -p "Enter username: " username
    read -p "Enter server IP or hostname: " server
    ssh-copy-id $username@$server
    echo "SSH key copied successfully."
    ;;

  3)
    read -p "Enter server IP or hostname: " server
    if ssh -q -o "BatchMode=yes" $server "exit"; then
      echo "SSH connection successful!"
    else
      echo "SSH connection failed."
    fi
    ;;

  4)
    echo "Exiting..."
    exit 0
    ;;

  *)
    echo "Invalid choice. Please select a number between 1 and 4."
    ;;
esac
