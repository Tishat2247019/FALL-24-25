#!/bin/bash
read -p "Enter your ame:" name
echo "Your name is $name"
a=0
until [ ! $a -lt 10 ]; do
echo $a
a=`expr $a + 1`
done 
