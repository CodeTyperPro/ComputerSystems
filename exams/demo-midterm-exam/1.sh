#!/bin/sh

isNumber(){
	result=`echo "$1" | grep "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"`
	
	if test ${#result} -eq 0
	then
		return 0
	fi
	return 1
}

if test $# -ne 2
then
	echo "Missing arguments."
	exit 1
else
	isNumber $1
	x=$?
	
	isNumber $2
	y=$?
	
	if test $x -eq 0
	then
		echo "Please, insert valid input(s)."
		exit 0
	elif test $y -eq 0
	then
		echo "Please, valid input(s)."
		exit 0
	fi

	x=$1
	y=$2
	
	res=1
	for i in `seq 0  $y`
	do
		echo -n $res " "
		res=`expr $res \* $x`
	done
	echo ""
fi