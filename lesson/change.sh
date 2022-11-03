#!bin/sh

while read line
do
	first=`echo | cut -d" " -f1`
	second=`echo | cut -d" " -f2`

	echo $second $first
done < $1
