#!/bin/bash
#
# SYNOPSIS
#     Analyze disk usage by directory
# DESCRIPTION
#     Shows disk usage for top-level directories
# USAGE
#     ./get-disk-usage.sh
#     ./get-disk-usage.sh /home 20
#

PATH_TO_ANALYZE=${1:-.}
TOP_COUNT=${2:-10}

echo "Analyzing disk usage in $PATH_TO_ANALYZE..."
echo ""

du -sh "$PATH_TO_ANALYZE"/* 2>/dev/null | sort -rh | head -n "$TOP_COUNT" | \
    awk '{printf "%-50s %10s\n", $2, $1}' | column -t
