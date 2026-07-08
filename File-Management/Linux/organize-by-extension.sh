#!/bin/bash
# Organize files by extension into subdirectories
# Usage: ./organize-by-extension.sh /path/to/organize

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-organize>"
    exit 1
fi

TARGET_PATH="$1"

if [ ! -d "$TARGET_PATH" ]; then
    echo "Error: Directory does not exist: $TARGET_PATH"
    exit 1
fi

echo "Organizing files in $TARGET_PATH by extension..."

cd "$TARGET_PATH"

find . -maxdepth 1 -type f | while read file; do
    filename=$(basename "$file")
    extension="${filename##*.}"
    
    if [ "$extension" = "$filename" ]; then
        extension="no-extension"
    fi
    
    if [ ! -d "$extension" ]; then
        mkdir -p "$extension"
    fi
    
    mv "$file" "$extension/"
    echo "Moved: $filename -> $extension/"
done

echo "Organization complete!"
