#!/bin/bash

echo "============================"
echo "🧹 Starting Memory Cleanup"
echo "============================"

# Display memory usage before cleanup
echo "📊 Memory Usage Before Cleanup:"
free -h

# Clear PageCache, dentries, and inodes
echo "Clearing PageCache, Dentries, and Inodes..."
sync; echo 3 > /proc/sys/vm/drop_caches

# Optional: Clear swap memory
echo "Clearing Swap Space..."
swapoff -a && swapon -a

# Display memory usage after cleanup
echo "📊 Memory Usage After Cleanup:"
free -h

echo "✅ Memory Cleanup Completed."
