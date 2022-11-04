#!/bin/sh

isNumber(){
	result=`echo "$1" | grep "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"`
	
	if test ${#result} -eq 0
	then
		return 0
	fi
	return 1
}

if test $# -ne 3
then
	echo "Missing arguments."
	exit 1
else
	isNumber $1
	x=$?
	
	isNumber $2
	y=$?

    isNumber $3
    z=$?
	
	if test $x -eq 0
	then
		echo "Please, insert valid input(s)."
		exit 0
	elif test $y -eq 0
	then
		echo "Please, valid input(s)."
		exit 0
    elif test $z -eq 0
	then
		echo "Please, valid input(s)."
		exit 0
	fi

	x=$1
	y=$2
    z=$3

    list=`echo "$x $y $z"`

    echo -n "$list"
    echo -n " => "

	for i in `echo $list`
	do
		res=`expr $i \* 3`
		echo -n $res " "
	done
	echo ""
fi