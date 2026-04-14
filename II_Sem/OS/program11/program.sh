#!/bin/bash
# Function to compute GCD
gcd() {
    a=$1
    b=$2
    while [ $b -ne 0 ]
    do
        temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}
# Function to compute LCM
lcm() {
    a=$1
    b=$2
    g=$(gcd $a $b)
    echo $(( (a*b)/g ))
}
echo "Enter numbers:"
read -a arr

n=${#arr[@]}

g=${arr[0]}
l=${arr[0]}

for ((i=1;i<n;i++))
do
    g=$(gcd $g ${arr[i]})
    l=$(lcm $l ${arr[i]})
done
echo "GCD of numbers = $g"
echo "LCM of numbers = $l"