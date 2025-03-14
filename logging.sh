#!/bin/bash

LOGFILE="script.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOGFILE"
}

log "🚀 Script started"
sleep 2
log "✅ Task completed"
