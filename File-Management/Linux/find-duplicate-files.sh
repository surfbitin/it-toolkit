#!/bin/bash
# Find duplicate files by checksum
# Usage: ./find-duplicate-files.sh /path/to/search

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-search>"
    exit 1
fi

SEARCH_PATH="$1"

if [ ! -d "$SEARCH_PATH" ]; then
    echo "Error: Directory does not exist: $SEARCH_PATH"
    exit 1
fi

echo "Finding duplicate files in $SEARCH_PATH..."
echo ""

find "$SEARCH_PATH" -type f -exec md5sum {} + | sort | uniq -d -w32 | while read hash file; do
    echo "Duplicate found: $file (hash: $hash)"
done

echo ""
echo "Duplicate search complete!"
