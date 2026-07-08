#!/bin/bash
#
# SYNOPSIS
#     Test connectivity to common services
# DESCRIPTION
#     Tests connectivity to DNS servers, gateway, and internet
# USAGE
#     ./test-connectivity.sh
#     ./test-connectivity.sh 8.8.8.8
#

TARGET=${1:-8.8.8.8}

echo "Testing connectivity..."
echo ""

# Test Google DNS
echo -n "Google DNS (8.8.8.8): "
if ping -c 1 -W 2 8.8.8.8 &>/dev/null; then
    echo "✓ Online"
else
    echo "✗ Offline"
fi

# Test Cloudflare DNS
echo -n "Cloudflare DNS (1.1.1.1): "
if ping -c 1 -W 2 1.1.1.1 &>/dev/null; then
    echo "✓ Online"
else
    echo "✗ Offline"
fi

# Test Gateway
GATEWAY=$(ip route show | grep default | awk '{print $3}')
echo -n "Default Gateway ($GATEWAY): "
if ping -c 1 -W 2 "$GATEWAY" &>/dev/null; then
    echo "✓ Online"
else
    echo "✗ Offline"
fi

# Test custom target
echo -n "Custom Target ($TARGET): "
if ping -c 1 -W 2 "$TARGET" &>/dev/null; then
    echo "✓ Online"
else
    echo "✗ Offline"
fi
