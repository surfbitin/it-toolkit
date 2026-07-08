#!/bin/bash
# check-dns-resolution.sh
# Check DNS resolution and performance

echo "DNS Resolution Check"
echo "===================="
echo ""

echo "Current DNS Servers:"
cat /etc/resolv.conf | grep nameserver
echo ""

echo "DNS Resolution Test:"
echo "Testing google.com..."
start=$(date +%s%N | cut -b1-13)
result=$(dig +short google.com @8.8.8.8 | head -1)
end=$(date +%s%N | cut -b1-13)
response_time=$((end - start))

if [ -n "$result" ]; then
    echo "  Result: $result"
    echo "  Response Time: ${response_time}ms"
else
    echo "  FAILED - No response"
fi
echo ""

echo "DNS Server Performance:"
for dns in 8.8.8.8 1.1.1.1; do
    start=$(date +%s%N | cut -b1-13)
    dig +short google.com @$dns > /dev/null 2>&1
    end=$(date +%s%N | cut -b1-13)
    response_time=$((end - start))
    echo "  $dns: ${response_time}ms"
done
