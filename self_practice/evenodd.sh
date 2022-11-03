#!/bin/sh

row_number=1

if test $# -ne 1
then	
	echo "I need a file name to work with ..."
	exit 1
fi

if test -f $1
then
	if test -f even.data
	then
		rm even.data
	fi
	
	if test -f odd.data
	then
		rm odd.data
	fi

	while read number
	do
		if test `expr $row_number % 2` -eq 0
		then
			echo "$row_number $number" >> even.data
		else
			echo "$row_number $number" >> odd.data
		fi

		row_number=`expr $row_number + 1`
	done < $1
else
	echo "File not found."
fi
