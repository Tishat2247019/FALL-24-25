#!/bin/bash
echo "Enter 2 intergers separeted by space:"
read -a numbers
sum=0
for i in "${numbers[@]}"
do
	sum=$((sum + i))

done
echo "the sum of the array elements is: $sum "
