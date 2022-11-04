#!/bin/sh

FILE=$1

if test $# -eq 0
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

	
	echo "ORIGINAL CONTENT OF FILE: "
	cat $FILE

	#Update FILE
	index=1
	while read line
	do
		if test $line -eq $max_number_
		then 
			sed -i "$index s/$/ => $line/g" $FILE
		else
			sed -i "$index s/$/    $line/g" $FILE
		fi

		index=`expr $index + 1`
	done < $TEMP

	echo ""
	echo "FILE MODIFIED: "
	cat $FILE
else
	echo "File not found."
fi