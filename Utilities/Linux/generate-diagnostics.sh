#!/bin/bash
# generate-diagnostics.sh
# Generate comprehensive system diagnostic report

REPORT_FILE="system-diagnostics-$(date +%Y%m%d-%H%M%S).txt"

echo "Generating system diagnostic report..."
echo ""

{
    echo "System Diagnostic Report"
    echo "Generated: $(date)"
    echo "================================================"
    echo ""
    
    echo "1. System Information"
    echo "  Hostname: $(hostname)"
    echo "  Kernel: $(uname -r)"
    echo "  OS: $(lsb_release -d | cut -f2)"
    echo "  Uptime: $(uptime -p)"
    echo ""
    
    echo "2. CPU Information"
    nproc --all > /dev/null 2>&1 && echo "  Cores: $(nproc --all)" || echo "  Cores: $(grep -c ^processor /proc/cpuinfo)"
    echo ""
    
    echo "3. Memory Information"
    free -h | awk '/^Mem:/ {print "  Total: " $2 "\n  Used: " $3 "\n  Free: " $4}'
    echo ""
    
    echo "4. Disk Space"
    df -h | tail -n +2
    echo ""
    
    echo "5. Network Interfaces"
    ip -4 addr show | grep -E "^[0-9]:|inet "
    echo ""
    
    echo "6. Running Services"
    systemctl list-units --type=service --state=running --no-pager | head -20
    echo ""
    
} > "$REPORT_FILE"

echo "Diagnostic report saved to: $REPORT_FILE"
echo "File size: $(du -h "$REPORT_FILE" | awk '{print $1}')"
