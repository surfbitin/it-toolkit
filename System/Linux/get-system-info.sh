#!/bin/bash
# get-system-info.sh
# Display comprehensive system information

echo "System Information"
echo "=================="
echo ""

echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "OS: $(lsb_release -d | cut -f2)"
echo ""

echo "CPU Information:"
echo "  Model: $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
echo "  Cores: $(grep -c ^processor /proc/cpuinfo)"
echo "  Speed: $(grep -m1 'cpu MHz' /proc/cpuinfo | cut -d: -f2 | xargs | cut -d. -f1) MHz"
echo ""

echo "Memory Information:"
free -h | awk '/^Mem:/ {print "  Total: " $2 "\n  Used: " $3 "\n  Free: " $4}'
echo ""

echo "Disk Information:"
df -h | awk 'NR>1 {print "  " $1 ": " $4 " free of " $2 " (" $5 " used)"}'
echo ""

echo "Uptime: $(uptime -p)"
echo "Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
