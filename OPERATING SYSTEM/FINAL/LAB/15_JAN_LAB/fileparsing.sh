#!/bin/bash
echo Name-ID > data.txt
echo Md. Abu towsif-47019 >> data.txt
echo Farjana Yesmin Opi-47018 >> data.txt
echo Shohanur Rahman Rafi-46913 >> data.txt

echo
file=data.txt

while IFS="-" read -r name id   #internal field separator
do
	echo "Name: $name, ID: $id"
done < "$file"
