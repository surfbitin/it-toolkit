#!/bin/bash
# Remove files older than specified days
# Usage: ./remove-old-files.sh -p /path/to/files -d 30

set -e

PATH_TO_CLEAN=""
DAYS=30

while getopts "p:d:h" opt; do
    case $opt in
        p) PATH_TO_CLEAN="$OPTARG" ;;
        d) DAYS="$OPTARG" ;;
        h) echo "Usage: $0 -p /path/to/clean -d days"; exit 0 ;;
        *) echo "Invalid option"; exit 1 ;;
    esac
done

if [ -z "$PATH_TO_CLEAN" ]; then
    echo "Error: Path is required"
    exit 1
fi

if [ ! -d "$PATH_TO_CLEAN" ]; then
    echo "Error: Directory does not exist: $PATH_TO_CLEAN"
    exit 1
fi

echo "Removing files older than $DAYS days in $PATH_TO_CLEAN"

find "$PATH_TO_CLEAN" -type f -mtime +$DAYS -delete

echo "Cleanup complete!"
