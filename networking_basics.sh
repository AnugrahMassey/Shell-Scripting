#!/bin/bash

echo "🌐 Networking Basics Menu"
echo "1. Check your current IP address"
echo "2. Ping a website to test connectivity"
echo "3. Display network interfaces and routing table"
echo "4. Perform DNS lookup (nslookup)"
echo "5. Exit"
read -p "Choose an option (1-5): " choice

case $choice in
  1)
    echo "🖥️ Your current IP address is:"
    hostname -I || ip a | grep 'inet ' | awk '{print $2}'
    ;;
  2)
    read -p "Enter a website or IP to ping (e.g., google.com): " website
    echo "📡 Pinging $website..."
    ping -c 4 "$website"
    ;;
  3)
    echo "🌐 Network Interfaces:"
    ip addr show

    echo "🛣️ Routing Table:"
    ip route show
    ;;
  4)
    read -p "Enter domain for DNS lookup (e.g., google.com): " domain
    echo "🔎 Performing DNS lookup for $domain..."
    nslookup "$domain"
    ;;
  5)
    echo "🚪 Exiting script."
    exit 0
    ;;
  *)
    echo "❗ Invalid choice. Please select a valid option."
    ;;
esac
