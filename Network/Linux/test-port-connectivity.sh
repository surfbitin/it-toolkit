#!/bin/bash
# test-port-connectivity.sh
# Test connectivity to specific ports

echo "Port Connectivity Test"
echo "======================"
echo ""

if [ $# -lt 2 ]; then
    echo "Usage: $0 <host> <port> [port2] [port3] ..."
    echo "Example: $0 google.com 80 443 8080"
    exit 1
fi

HOST=$1
shift
PORTS=$@

echo "Testing connectivity to $HOST"
echo ""

for port in $PORTS; do
    if timeout 2 bash -c "cat < /dev/null > /dev/tcp/$HOST/$port" 2>/dev/null; then
        echo "Port $port: OPEN"
    else
        echo "Port $port: CLOSED"
    fi
done
