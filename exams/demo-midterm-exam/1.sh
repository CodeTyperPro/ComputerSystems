#!/bin/sh

isNumber(){
	data=$1
	res=`echo $data | grep "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"`
	return $res
}

if test $# -ne 2
then
	echo "Missing arguments."
	exit 1
else
	x=$1
	y=$2

	isNumber $x
	#x=$?

	isNumber $y
	#y=$?

	if [[ ! -z $x || ! -z $y ]]
	then
		echo "Please, insert numbers. (valid inputs)"
		exit 1
	fi
	
	res=1
	for i in `seq 1  $y`
	do
		echo -n $res " "
		res=`expr $res \* $x`
	done
	echo ""
fi
