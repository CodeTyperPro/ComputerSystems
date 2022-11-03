#!/bin/sh

prime(){
	number=2

	while test `expr $1  % $number` -ne 0
	do
		number=`expr $number + 1`
	done

	test $1 -eq $number

	return $?
}

for i in `seq $1 $2`
do
	if
		prime $i
	then
		echo "$i is prime number."
	fi
done
