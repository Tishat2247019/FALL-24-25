#i/bin/bash
read -p "Enter a value : " a
read -p "Enter a value : " b
if [ $a -eq $b ]; then
        echo "The values are equal"
elif [ $a -gt $b ] ; then
	echo "$a is greater than $b"
else
        echo "$a less than $b"
fi
