#!/bin/bash

echo "=============================="
echo "🛡️  Firewall Manager"
echo "=============================="

# Function to display menu
function show_menu() {
    echo "1. Add Rule"
    echo "2. Delete Rule"
    echo "3. List Rules"
    echo "4. Exit"
}

# Function to add a firewall rule
function add_rule() {
    echo "👉 Select rule type:"
    echo "1. Allow Port"
    echo "2. Block Port"
    echo "3. Allow IP"
    echo "4. Block IP"
    read -p "Enter choice: " rule_type

    case $rule_type in
        1) 
            read -p "Enter port to allow (e.g., 80, 443): " port
            sudo iptables -A INPUT -p tcp --dport $port -j ACCEPT
            echo "✅ Port $port is now allowed."
            ;;
        2)
            read -p "Enter port to block (e.g., 22, 8080): " port
            sudo iptables -A INPUT -p tcp --dport $port -j DROP
            echo "❗ Port $port is now blocked."
            ;;
        3)
            read -p "Enter IP to allow (e.g., 192.168.1.10): " ip
            sudo iptables -A INPUT -s $ip -j ACCEPT
            echo "✅ IP $ip is now allowed."
            ;;
        4)
            read -p "Enter IP to block (e.g., 203.0.113.45): " ip
            sudo iptables -A INPUT -s $ip -j DROP
            echo "❗ IP $ip is now blocked."
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
