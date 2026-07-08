#!/bin/bash
# monitor-bandwidth.sh
# Monitor network bandwidth usage in real-time

echo "Network Bandwidth Monitor"
echo "========================="
echo ""

INTERFACE=${1:-eth0}

if ! ip link show "$INTERFACE" > /dev/null 2>&1; then
    echo "Interface $INTERFACE not found"
    echo "Available interfaces:"
    ip link show | grep -oP '^\d+: \K[^:]+'
    exit 1
fi

echo "Monitoring interface: $INTERFACE"
echo "Press Ctrl+C to exit"
echo ""

while true; do
    RX_BEFORE=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX_BEFORE=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    
    sleep 1
    
    RX_AFTER=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX_AFTER=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    
    RX_RATE=$((($RX_AFTER - $RX_BEFORE) / 1024))
    TX_RATE=$((($TX_AFTER - $TX_BEFORE) / 1024))
    
    echo -ne "\rRX: ${RX_RATE}KB/s | TX: ${TX_RATE}KB/s\033[K"
done
