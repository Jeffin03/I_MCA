#!/bin/bash
read -p "Enter the number: " n
if (( n <= 1 )); then
    echo "$n is not a prime number"
    exit
fi
if (( n <= 3 )); then
    echo "$n is a prime number"
    exit
fi
if (( n % 2 == 0 )); then
    echo "$n is not a prime number"
    exit
fi
i=3
while (( i * i <= n )); do
    if (( n % i == 0 )); then
        echo "$n is not a prime number"
        exit
    fi    i=$(( i + 2 ))
done
echo "$n is a prime number"