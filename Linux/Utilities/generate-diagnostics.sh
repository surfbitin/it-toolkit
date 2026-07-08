#!/bin/bash
#
# SYNOPSIS
#     Generate system diagnostic report
# DESCRIPTION
#     Creates a comprehensive system report for troubleshooting
# USAGE
#     ./generate-diagnostics.sh
#     ./generate-diagnostics.sh /path/to/output
#

OUTPUT_DIR="${1:-.}"
REPORT_FILE="$OUTPUT_DIR/system-diagnostics-$(date +%Y%m%d-%H%M%S).txt"

echo "Generating system diagnostics report..."

cat > "$REPORT_FILE" << EOF
=== SYSTEM DIAGNOSTICS REPORT ===
Generated: $(date)
Hostname: $(hostname)

--- System Information ---
EOF

uname -a >> "$REPORT_FILE"
lsb_release -a >> "$REPORT_FILE" 2>/dev/null

cat >> "$REPORT_FILE" << EOF

--- CPU Information ---
EOF
lscpu >> "$REPORT_FILE"

cat >> "$REPORT_FILE" << EOF

--- Memory Information ---
EOF
free -h >> "$REPORT_FILE"

cat >> "$REPORT_FILE" << EOF

--- Disk Information ---
EOF
df -h >> "$REPORT_FILE"

cat >> "$REPORT_FILE" << EOF

--- Network Configuration ---
EOF
ip addr show >> "$REPORT_FILE"
ip route show >> "$REPORT_FILE"

cat >> "$REPORT_FILE" << EOF

--- Services Status ---
EOF
systemctl list-units --type=service --state=running >> "$REPORT_FILE" 2>/dev/null

cat >> "$REPORT_FILE" << EOF

--- Recent System Logs ---
EOF
journalctl -n 50 --no-pager >> "$REPORT_FILE" 2>/dev/null

echo "Report generated: $REPORT_FILE"
echo "File size: $(du -h "$REPORT_FILE" | cut -f1)"
