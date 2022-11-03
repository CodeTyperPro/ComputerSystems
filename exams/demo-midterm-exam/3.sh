#!/bin/sh

FILE=$1

if test $# -eq 0
then
	echo "Missing filename via command line."
elif test -f $FILE
then
	echo "File exists!"
	echo "" > short.txt
	while read line
	do
		len=`echo $line | wc -c`
	       	echo $len
		if test $len -lt 5
		then 
			echo $line >> short.txt
		fi
	done < $FILE
else 
	echo "Sorry! The file was not found in our system."
fi
