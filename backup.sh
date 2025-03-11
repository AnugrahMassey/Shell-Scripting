#!/bin/bash

SRC_DIR="/home/user"
BACKUP_DIR="/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "📦 Creating backup of $SRC_DIR at $BACKUP_FILE..."
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_FILE" "$SRC_DIR"

echo "✅ Backup completed!"
