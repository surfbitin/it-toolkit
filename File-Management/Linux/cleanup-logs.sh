#!/bin/bash
# Clean up old log files
# Usage: ./cleanup-logs.sh -p /path/to/logs -d 30

set -e

LOG_PATH=""
DAYS=30

while getopts "p:d:h" opt; do
    case $opt in
        p) LOG_PATH="$OPTARG" ;;
        d) DAYS="$OPTARG" ;;
        h) echo "Usage: $0 -p /path/to/logs -d days"; exit 0 ;;
        *) echo "Invalid option"; exit 1 ;;
    esac
done

if [ -z "$LOG_PATH" ]; then
    echo "Error: Log path is required"
    exit 1
fi

if [ ! -d "$LOG_PATH" ]; then
    echo "Error: Directory does not exist: $LOG_PATH"
    exit 1
fi

echo "Cleaning logs older than $DAYS days in $LOG_PATH"

find "$LOG_PATH" -name "*.log" -type f -mtime +$DAYS -delete

echo "Log cleanup complete!"
