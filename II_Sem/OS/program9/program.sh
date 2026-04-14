#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <glossary_file>"
    exit 1
fi
file="$1"
N=10
mapfile -t lines < <(tail -n "$N" "$file" | awk '{print}')

echo "Last $N lines in reverse order:"
for (( i=${#lines[@]}-1; i>=0; i-- )); do
    echo "${lines[i]}"
done