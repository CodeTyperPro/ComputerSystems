#!/bin/sh

FILE=$1
OUTPUT="short.txt"

if test $# -eq 0
then
	echo "Missing filename via command line."
	exit 0
elif test -f $FILE
then

	if test -f $OUTPUT
	then 
		rm $OUTPUT
	fi

    min_len=`cat $FILE | wc -c -m | tr -d " "`
    #echo "MAX = $min_len" // I assume that the maximum number possible is the total number of characters :)
    string_min=""
	while read line
	do
        echo $line
		len=${#line}

		if test $len -lt $min_len
		then
            min_len=$len
            string_min="$line"
		fi
	done < $FILE

    echo " "
	echo "OUTPUT file: "
    echo $string_min > $OUTPUT
	cat $OUTPUT

    echo ""
    echo "Check $OUTPUT file please."
else 
	echo "Sorry! File not found."
fi
