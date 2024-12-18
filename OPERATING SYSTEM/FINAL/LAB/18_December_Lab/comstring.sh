#!/bin/bash
echo "Enter the first string:"
read a
echo "Enter the second string: "
read b
if [ "$a" = "$b" ]; then
        echo "The strings are equal"
else
        echo "The strings are not equal"
fi  
