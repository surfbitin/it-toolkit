#!/bin/bash
# get-disk-usage.sh
# Analyze disk usage by directory

PATH_TO_CHECK=${1:-.}
TOP_N=${2:-10}

echo "Disk Usage Analysis: $PATH_TO_CHECK"
echo "================================"
echo ""

echo "Total usage in directory:"
du -sh "$PATH_TO_CHECK"
echo ""

echo "Top $TOP_N subdirectories by size:"
du -h --max-depth=1 "$PATH_TO_CHECK" | sort -hr | head -n $((TOP_N + 1)) | tail -n +2 | awk '{print $1 "\t" $2}'
