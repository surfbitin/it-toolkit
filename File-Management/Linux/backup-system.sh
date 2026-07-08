#!/bin/bash
# Create compressed backup of directory
# Usage: ./backup-system.sh /path/to/backup backup-name.tar.gz

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <source-path> <backup-file>"
    exit 1
fi

SOURCE_PATH="$1"
BACKUP_FILE="$2"

if [ ! -d "$SOURCE_PATH" ]; then
    echo "Error: Source directory does not exist: $SOURCE_PATH"
    exit 1
fi

echo "Creating backup of $SOURCE_PATH..."

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_PATH")" "$(basename "$SOURCE_PATH")"

echo "Backup created successfully: $BACKUP_FILE"
echo "Size: $(du -h "$BACKUP_FILE" | cut -f1)"
