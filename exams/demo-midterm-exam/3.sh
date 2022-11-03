#!/bin/sh

FILE=$1
OUTPUT="short.txt"

if test $# -eq 0
then
	echo "Missing filename via command line."
	exit 0
elif test -f $FILE
then
	echo "" > $OUTPUT
	while read line
	do
		len=${#line}
		if test $len -lt 5
		then
			echo $line >> $OUTPUT
		fi
	done < $FILE
	echo "Output of $OUTPUT file: "
	cat $OUTPUT
else 
	echo "Sorry! File not found."
fi
