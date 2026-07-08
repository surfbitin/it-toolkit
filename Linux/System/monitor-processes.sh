#!/bin/bash
#
# SYNOPSIS
#     Monitor running processes
# DESCRIPTION
#     Display top processes by CPU and memory usage
# USAGE
#     ./monitor-processes.sh
#     ./monitor-processes.sh 20
#

TOP_COUNT=${1:-10}

echo "=== TOP PROCESSES BY CPU USAGE ==="
echo ""
ps aux --sort=-%cpu | head -n $((TOP_COUNT+1)) | awk '{printf "%-20s %6s %6s %10s\n", $1, $3, $4, $11}'

echo ""
echo "=== TOP PROCESSES BY MEMORY USAGE ==="
echo ""
ps aux --sort=-%mem | head -n $((TOP_COUNT+1)) | awk '{printf "%-20s %6s %6s %10s\n", $1, $3, $4, $11}'

echo ""
echo "=== TOTAL PROCESS COUNT ==="
echo "Total processes: $(ps aux | wc -l)"
