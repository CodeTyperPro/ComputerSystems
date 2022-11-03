#!/bin/sh

isPrime(){
	record=""
	cont=0
	num=$1

	for i in `seq 1 $num`
	do
		rem=`expr $num % $i`
		if test $rem -eq 0
		then
			cont=`expr $cont + 1`
			record="$record $i"
		fi
	done

	if test $cont -eq 2
	then
		echo "$num is a prime number."
	else 
		echo "$num is not a prime number."
		echo "Divisors: $record"
	fi
}


if test $# -ne 1
then
	echo "Nothing was passed via command line. Please do It!"
else 
	isPrime $1
fi
