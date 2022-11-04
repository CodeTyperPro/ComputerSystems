#!/bin/sh

FILE=$1

if $# -eq 0
then
	echo "Please, pass the file via command line."
elif test -f $FILE
then
	TEMP="temp.dat"
	if test -f $TEMP
	then 
		rm $TEMP
	fi

	max_number_=0
	index_maximum_=0
	index=0
	while read line
	do
		res=0
		for j in $line
		do
			if test $j -gt $res
			then
				res=$j
			fi
		done
		
		echo $res >> $TEMP # Temporary file

		if test $res -gt $max_number_
		then
			max_number_=$res
			index_maximum_=$index
		fi

		index=`expr $index + 1`
	done < $FILE

	#Update FILE
	index=0
	while read line
	do
		#`sed '$index i/{&} $line/g' $FILE`
		index=`expr $index + 1`
	done < $TEMP
else
	echo "File not found."
fi