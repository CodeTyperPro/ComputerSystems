#!/bin/sh

if test $# -ne 1
then
	echo missing name
	exit 1
fi

if test -f $1 
then
	cat  $line | grep -c "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"
	echo "There are $result"

else
	echo File not existing
fi
