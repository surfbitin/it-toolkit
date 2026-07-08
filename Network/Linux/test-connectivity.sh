#!/bin/bash
# test-connectivity.sh
# Test connectivity to DNS, gateway, and internet

echo "Connectivity Test"
echo "================="
echo ""

# Get default gateway
GATEWAY=$(ip route | grep default | awk '{print $3}' | head -1)
DNS_SERVER="8.8.8.8"
INTERNET_HOST="8.8.8.8"

# Test gateway
echo "Testing Gateway ($GATEWAY)..."
if ping -c 1 -W 2 "$GATEWAY" > /dev/null 2>&1; then
    echo "  Gateway: OK"
    GATEWAY_OK=1
else
    echo "  Gateway: FAILED"
    GATEWAY_OK=0
fi

# Test DNS
echo "Testing DNS ($DNS_SERVER)..."
if ping -c 1 -W 2 "$DNS_SERVER" > /dev/null 2>&1; then
    echo "  DNS: OK"
    DNS_OK=1
else
    echo "  DNS: FAILED"
    DNS_OK=0
fi

# Test Internet
echo "Testing Internet ($INTERNET_HOST)..."
if ping -c 1 -W 2 "$INTERNET_HOST" > /dev/null 2>&1; then
    echo "  Internet: OK"
    INTERNET_OK=1
else
    echo "  Internet: FAILED"
    INTERNET_OK=0
fi

echo ""
if [ $GATEWAY_OK -eq 1 ] && [ $DNS_OK -eq 1 ] && [ $INTERNET_OK -eq 1 ]; then
    echo "Overall Status: CONNECTED"
else
    echo "Overall Status: ISSUES DETECTED"
fi
