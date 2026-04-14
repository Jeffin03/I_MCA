#!/bin/bash
dir="."

echo "S.No | Creation Date        | File Name"
echo "------------------------------------------"
count=1

for file in "$dir"/*; do
    if [ -f "$file" ]; then
        creation_date=$(stat -c %w "$file")
        echo "$count    | $creation_date | $(basename "$file")"
        count=$((count+1))
    fi
done