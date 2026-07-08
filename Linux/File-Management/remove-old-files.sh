#!/bin/bash
#
# SYNOPSIS
#     Remove files older than specified days
# DESCRIPTION
#     Safely removes files older than specified number of days from a directory
# USAGE
#     ./remove-old-files.sh /path/to/clean 30
#     ./remove-old-files.sh /var/log 90 "*.log"
#

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <path> <days> [pattern]"
    echo "Example: $0 /tmp 30 '*.log'"
    exit 1
fi

PATH_TO_CLEAN="$1"
DAYS="$2"
PATTERN="${3:---}"

if [[ ! -d "$PATH_TO_CLEAN" ]]; then
    echo "Error: Directory '$PATH_TO_CLEAN' does not exist"
    exit 1
fi

echo "Scanning for files older than $DAYS days in $PATH_TO_CLEAN..."
echo ""

if [[ "$PATTERN" == "--" ]]; then
    FILES=$(find "$PATH_TO_CLEAN" -type f -mtime +"$DAYS" -printf '%T@ %p\n' | sort -n | awk '{print $2}')
else
    FILES=$(find "$PATH_TO_CLEAN" -type f -name "$PATTERN" -mtime +"$DAYS" -printf '%T@ %p\n' | sort -n | awk '{print $2}')
fi

if [[ -z "$FILES" ]]; then
    echo "No files found older than $DAYS days"
    exit 0
fi

echo "Found $(echo "$FILES" | wc -l) file(s) to remove:"
echo "$FILES" | head -20

if [[ $(echo "$FILES" | wc -l) -gt 20 ]]; then
    echo "... and $(($(echo "$FILES" | wc -l) - 20)) more"
fi

echo ""
read -p "Are you sure you want to delete these files? (yes/no): " CONFIRM

if [[ "$CONFIRM" == "yes" ]]; then
    echo "$FILES" | xargs rm -f
    echo "Files deleted successfully"
else
    echo "Operation cancelled"
fi
