#!/bin/bash
# get-network-status.sh
# Display network interfaces and IP configuration

echo "Network Status"
echo "=============="
echo ""

echo "Active Network Interfaces:"
ip -4 addr show | grep -E "^[0-9]:|inet " | sed 's/^/  /'

echo ""
echo "Network Statistics:"
ss -i | head -20

echo ""
echo "Default Route:"
ip route | grep default
