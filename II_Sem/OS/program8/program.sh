#!/bin/bash
lines=0
words=0
chars=0
while IFS= read -r line || [ -n "$line" ]; do
    lines=$((lines + 1))
    chars=$((chars + ${#line} + 1))
    for w in $line; do
        words=$((words + 1))
    done
done

echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"