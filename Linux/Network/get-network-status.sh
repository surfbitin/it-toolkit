#!/bin/bash
#
# SYNOPSIS
#     Display network adapter status and configuration
# DESCRIPTION
#     Shows IP addresses, network interfaces, and connectivity status
# USAGE
#     ./get-network-status.sh
#

echo "=== NETWORK STATUS ==="

echo -e "\n--- Network Interfaces ---"
ip link show | grep -E '^[0-9]+:' | awk '{print $2}' | sed 's/:$//'

echo -e "\n--- IP Configuration ---"
ip addr show | grep -E 'inet|inet6' | awk '{print $NF ": " $2}'

echo -e "\n--- Routing Table ---"
ip route show | head -5

echo -e "\n--- DNS Configuration ---"
echo "DNS Servers:"
cat /etc/resolv.conf | grep nameserver | awk '{print " " $2}'

echo -e "\n--- Network Statistics ---"
ss -s

echo -e "\n--- Gateway ---"
ip route show | grep default | awk '{print "Gateway: " $3}'
