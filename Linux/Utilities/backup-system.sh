#!/bin/bash
#
# SYNOPSIS
#     Interactive system backup utility
# DESCRIPTION
#     Creates compressed backups of specified directories
# USAGE
#     ./backup-system.sh
#     ./backup-system.sh /home /var/www /etc
#

BACKUP_DIR="${HOME}/backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p "$BACKUP_DIR"

echo "=== SYSTEM BACKUP UTILITY ==="
echo ""

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 [directories to backup]"
    echo "Example: $0 /home /etc /var/www"
    exit 1
fi

echo "Backup destination: $BACKUP_DIR"
echo "Timestamp: $TIMESTAMP"
echo ""

for DIR in "$@"; do
    if [[ ! -d "$DIR" ]]; then
        echo "Warning: Directory '$DIR' does not exist, skipping..."
        continue
    fi
    
    BACKUP_NAME="backup-$(basename "$DIR")-$TIMESTAMP.tar.gz"
    BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"
    
    echo "Backing up: $DIR"
    tar -czf "$BACKUP_PATH" -C "$(dirname "$DIR")" "$(basename "$DIR")" 2>/dev/null
    
    if [[ $? -eq 0 ]]; then
        SIZE=$(du -h "$BACKUP_PATH" | cut -f1)
        echo "  ✓ Completed: $BACKUP_NAME ($SIZE)"
    else
        echo "  ✗ Failed to backup $DIR"
    fi
    echo ""
done

echo "All backups saved to: $BACKUP_DIR"
