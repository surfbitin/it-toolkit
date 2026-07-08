#!/bin/bash
#
# SYNOPSIS
#     Display comprehensive system information
# DESCRIPTION
#     Shows CPU, RAM, Disk, OS, uptime, and kernel information
# USAGE
#     ./get-system-info.sh
#

echo "=== SYSTEM INFORMATION ==="

echo -e "\n--- Operating System ---"
lsb_release -d | awk -F'\t' '{print "OS: " $2}'
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"

echo -e "\n--- CPU ---"
echo "Processors: $(nproc)"
echo "CPU Model: $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
lscpu | grep -E 'CPU\(s\)|Core\(s\)' | xargs

echo -e "\n--- Memory ---"
free -h | awk 'NR==2 {print "Total RAM: " $2}'
free -h | awk 'NR==2 {print "Used RAM: " $3}'
free -h | awk 'NR==2 {print "Available RAM: " $7}'

echo -e "\n--- Disk Space ---"
df -h / | tail -n1 | awk '{print "Filesystem: " $1 "\nTotal: " $2 "\nUsed: " $3 "\nAvailable: " $4 "\nUsage: " $5}'

echo -e "\n--- Hostname & Network ---"
echo "Hostname: $(hostname)"
echo "Domain: $(hostname -d 2>/dev/null || echo 'N/A')"
echo "FQDN: $(hostname -f)"
