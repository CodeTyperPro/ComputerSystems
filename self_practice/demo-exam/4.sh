#!/bin/sh

FILE=$1

max(){
	x=$1
	y=$2

	if test $x -ge $y
	then
		return $x	
	fi	

	return $y
}

if $# -eq 0
then
	echo "Please, pass the file via command line."
elif test -f $FILE
then
	while read line
	do
		res=0
		for j in $line
		do
			max $res $j
			res=$?
		done
		
		echo $res	
	done < $FILE
else
	echo "File not found."
fi
