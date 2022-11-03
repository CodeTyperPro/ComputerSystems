#!/bin/sh

echo -n "Enter a word: "
read word

while test "$word" != "end"
do
	echo $word >> temp.data
	echo -n "Enter a word: "
	read word
done 

sort temp.data
rm temp.data

if test -f temp.data
then 
	sort temp.data
	rm temp.data
fi
