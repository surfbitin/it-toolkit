#!/bin/bash
# remove-old-files.sh
# Remove files older than specified days

echo "Remove Old Files"
echo "================"
echo ""

while getopts "p:d:" opt; do
    case $opt in
        p) PATH="$OPTARG" ;;
        d) DAYS="$OPTARG" ;;
        *) echo "Usage: $0 -p <path> -d <days>"; exit 1 ;;
    esac
done

if [ -z "$PATH" ] || [ -z "$DAYS" ]; then
    echo "Usage: $0 -p <path> -d <days>"
    echo "Example: $0 -p /tmp -d 30"
    exit 1
fi

echo "Searching for files older than $DAYS days in $PATH"
echo ""

FILE_COUNT=$(find "$PATH" -type f -mtime +$DAYS 2>/dev/null | wc -l)

if [ $FILE_COUNT -eq 0 ]; then
    echo "No files found older than $DAYS days"
    exit 0
fi

echo "Found $FILE_COUNT files to delete"
echo ""

TOTAL_SIZE=$(find "$PATH" -type f -mtime +$DAYS 2>/dev/null -exec du -c {} \; | tail -1 | awk '{print $1}')

echo "Files to be deleted:"
find "$PATH" -type f -mtime +$DAYS 2>/dev/null | head -20

if [ $FILE_COUNT -gt 20 ]; then
    echo "... and $((FILE_COUNT - 20)) more files"
fi

echo ""
echo "Total size: $(($TOTAL_SIZE)) KB"
echo ""
read -p "Continue with deletion? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    find "$PATH" -type f -mtime +$DAYS -delete
    echo "Deletion complete"
else
    echo "Deletion cancelled"
fi
