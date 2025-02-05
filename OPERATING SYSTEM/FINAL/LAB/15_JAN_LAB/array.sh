#!/bin/bash

os=('ubuntu', 'windows', 'linux')
os1=("ubuntu" "windows" "Linuxe")
echo "${os[0]}"
echo "${os[1]}"
echo "${os[2]}"

echo              #new line for echo to print in the same line, we have to use ech -e
echo "${#os[@]}" #length of array 

for i in "${os1[@]}"; do
	echo $i

done
