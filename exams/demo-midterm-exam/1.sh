#!/bin/sh

if test $# -ne 2
then
	echo "Missing arguments."
else
	x=$1
	y=$2
	
	res=1
	for i in `seq 1  $y`
	do
		echo -n $res " "
		res=`expr $res \* $x`
	done
	echo ""
fi
