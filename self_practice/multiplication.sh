#!/bin/sh
echo
echo "MULTIPLICATION TABLE [10x10]\n"

for i in `seq 10`
do
	for j in `seq 10`
	do
		res=`expr $i \* $j`
		
		echo -n $res "\t"
	done
	echo
	
done

echo
