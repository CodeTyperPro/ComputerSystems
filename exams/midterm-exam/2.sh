#!/bin/sh

if test $# -eq 0
then
	echo "Missing arguments via command line."
	exit 0
else
    lines=$*
    res=""
    for i in $lines
    do
        echo $i
        e=`echo $i | cut -c 3`
        res="$res $e"
    done
    echo "$lines => $res"
fi