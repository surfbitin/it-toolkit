#!/bin/bash
# system-health-check.sh
# Perform comprehensive system health check

echo "System Health Check"
echo "==================="
echo ""

echo "1. Disk Space Check:"
df -h | awk 'NR>1 {print "   " $1 ": " $5 " used"}'
echo ""

echo "2. Memory Usage:"
free -h | awk '/^Mem:/ {print "   Used: " $3 " / " $2}'
echo ""

echo "3. System Load:"
uptime | awk -F'load average:' '{print "   " $2}'
echo ""

echo "4. Failed System Services:"
systemctl list-units --failed --no-pager | grep -E '^●' || echo "   All services running"
echo ""

echo "5. Recent Kernel Errors:"
journalctl -p err --since "1 hour ago" --no-pager | tail -5 || echo "   No errors in last hour"
echo ""

echo "6. Disk I/O Errors:"
dmesg | grep -i "error" | tail -5 || echo "   No disk errors detected"
