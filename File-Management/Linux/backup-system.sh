#!/bin/bash
# backup-system.sh
# Create compressed backups of directories

echo "System Backup Utility"
echo "===================="
echo ""

if [ $# -lt 2 ]; then
    echo "Usage: $0 <source_directory> <output_file>"
    echo "Example: $0 /home/user backup.tar.gz"
    exit 1
fi

SOURCE="$1"
OUTPUT="$2"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory not found: $SOURCE"
    exit 1
fi

echo "Backing up: $SOURCE"
echo "Output file: $OUTPUT"
echo ""

echo "Starting backup..."
tar -czf "$OUTPUT" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")" 2>/dev/null

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$OUTPUT" | awk '{print $1}')
    echo "Backup complete!"
    echo "Backup size: $SIZE"
else
    echo "Backup failed!"
    exit 1
fi
