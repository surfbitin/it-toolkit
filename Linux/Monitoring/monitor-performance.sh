#!/bin/bash
#
# SYNOPSIS
#     Monitor system performance
# DESCRIPTION
#     Display real-time system performance metrics
# USAGE
#     ./monitor-performance.sh
#

echo "=== SYSTEM PERFORMANCE MONITOR ==="
echo "(Press Ctrl+C to exit)"
echo ""

while true; do
    clear
    echo "=== SYSTEM PERFORMANCE MONITOR ==="
    echo "Updated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    
    # CPU Usage
    echo "--- CPU Usage ---"
    grep 'cpu ' /proc/stat | awk '{printf "CPU Usage: %.1f%%\n", 100 * (1 - $5 / ($2 + $3 + $4 + $5 + $6 + $7 + $8))}'
    
    # Memory Usage
    echo ""
    echo "--- Memory Usage ---"
    free -h | awk 'NR==2 {split($3, a, /[GMK]/); split($2, b, /[GMK]/); printf "Memory: %s / %s (%.1f%%)\n", $3, $2, ($3 / $2) * 100}'
    
    # Load Average
    echo ""
    echo "--- Load Average ---"
    uptime | awk -F'load average:' '{print "Load: " $2}'
    
    # Disk I/O
    echo ""
    echo "--- Network Activity ---"
    ss -s | grep TCP
    
    # Top processes
    echo ""
    echo "--- Top 5 Processes by CPU ---"
    ps aux --sort=-%cpu | head -6 | tail -5 | awk '{printf "%-10s %6s %6s\n", $1, $3, $11}'
    
    sleep 5
done
