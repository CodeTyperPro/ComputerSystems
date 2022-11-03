#!/bin/sh

sum=0

if test $# -ne 0
then 
	data=$*
else
	data=`cat`
fi
for i in `echo $data`
do
	sum=`expr $sum + $i`
done

echo "Sum = $sum"
