#!/bin/bash

# Check if the domain is provided
if [ -z "$1" ]; then
    echo "❗ Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1

echo "=============================="
echo "🔎 Performing DNS Check for: $DOMAIN"
echo "=============================="

# Perform DNS Lookup using nslookup
echo "🔍 Using nslookup..."
nslookup $DOMAIN

# Perform DNS Lookup using dig
echo "🔍 Using dig..."
dig +short $DOMAIN

# Check if the domain is reachable
echo "🌐 Checking domain reachability..."
if ping -c 3 $DOMAIN &> /dev/null; then
    echo "✅ $DOMAIN is reachable."
else
    echo "❗ $DOMAIN is not reachable."
fi
