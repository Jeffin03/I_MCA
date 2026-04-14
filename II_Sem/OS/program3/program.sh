#!/bin/bash

#################################################
# SHELL PROGRAMMING LAB - ALL EXERCISES
# (For Study / Reference Only - Not for Execution)
#################################################

############################
# i. Interactive Shell Scripts
############################

# Exercise 1: Read name and greet user
: '
echo "Enter your name:"
read name
echo "Hello, $name! Welcome to Shell Programming."
'

# Exercise 2: Read two numbers and display sum
: '
echo "Enter first number:"
read a
echo "Enter second number:"
read b
sum=$((a + b))
echo "Sum = $sum"
'

############################
# ii. Positional Parameters
############################

# Exercise 3: Display command-line arguments
: '
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total arguments: $#"
echo "All arguments: $@"
'

# Exercise 4: Add two numbers using positional parameters
: '
sum=$(($1 + $2))
echo "Sum = $sum"
'

############################
# iii. Arithmetic Operations
############################

# Exercise 5: Arithmetic operations
: '
a=20
b=10
echo "Addition: $((a + b))"
echo "Subtraction: $((a - b))"
echo "Multiplication: $((a * b))"
echo "Division: $((a / b))"
echo "Modulus: $((a % b))"
'

# Exercise 6: Simple calculator
: '
echo "Enter two numbers:"
read a b
echo "Enter operator (+ - * /):"
read op
result=$(echo "$a $op $b" | bc)
echo "Result = $result"
'

############################
# iv. Conditional Statements
############################

# Exercise 7: Check positive number
: '
read n
if [ $n -gt 0 ]
then
 echo "Positive number"
fi
'

# Exercise 8: Even or Odd
: '
read n
if [ $((n % 2)) -eq 0 ]
then
 echo "Even number"
else
 echo "Odd number"
fi
'

# Exercise 9: Largest of three numbers
: '
read a b c
if [ $a -gt $b ]
then
 if [ $a -gt $c ]
 then
  echo "$a is largest"
 else
  echo "$c is largest"
 fi
else
 if [ $b -gt $c ]
 then
  echo "$b is largest"
 else
  echo "$c is largest"
 fi
fi
'

############################
# v. Logical Operators
############################

# Exercise 10: AND operator
: '
read age
if [ $age -ge 18 -a $age -le 60 ]
then
 echo "Eligible for work"
else
 echo "Not eligible"
fi
'

# Exercise 11: OR operator
: '
read ch
if [ "$ch" = "a" -o "$ch" = "e" -o "$ch" = "i" -o "$ch" = "o" -o "$ch" = "u" ]
then
 echo "Vowel"
else
 echo "Consonant"
fi
'

# Exercise 12: NOT operator
: '
read n
if [ ! $n -gt 0 ]
then
 echo "Zero or negative"
else
 echo "Positive"
fi
'

############################
# vi. if-elif-else and case
############################

# if-elif-else example
: '
read num
if [ $num -gt 10 ]; then
 echo "Greater than 10"
elif [ $num -eq 10 ]; then
 echo "Equal to 10"
else
 echo "Less than 10"
fi
'

# case structure example
: '
read grade
case $grade in
 A) echo "Excellent";;
 B) echo "Good";;
 C) echo "Passed";;
 D) echo "Barely passed";;
 F) echo "Failed";;
 *) echo "Invalid";;
esac
'

############################
# vii. Loops
############################

# While loop
: '
counter=1
while [ $counter -le 5 ]; do
 echo $counter
 ((counter++))
done
'

# Until loop
: '
counter=1
until [ $counter -gt 5 ]; do
 echo $counter
 ((counter++))
done
'

# For loop with break
: '
for i in {1..10}; do
 if [ $i -eq 6 ]; then
  break
 fi
 echo $i
done
'

#################################################
# END OF FILE
#################################################