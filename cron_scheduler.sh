#!/bin/bash

SCRIPT_PATH="/path/to/cleanup_logs.sh"

echo "⏳ Adding cron job to run log cleanup daily at 2 AM..."
(crontab -l 2>/dev/null; echo "0 2 * * * $SCRIPT_PATH") | crontab -

echo "✅ Cron job added!"
