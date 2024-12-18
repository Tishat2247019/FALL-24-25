#!/bin/bash
echo Good Afternoon
#Performing mathmetical operations
#echo $(expr 5 + 6)
#echo `expr 2 + 2`
#echo $((3+5))
#reading input a and b from the users
read a
read b
#mulitplicatins
echo Multiplicatin is  `expr $a  \* $b`
echo Multiplication is $(($a *$b))
#Division
echo Division of $a / $b is `expr $a / $b`

