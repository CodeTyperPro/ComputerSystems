#!/bin/bash

data_file=$1
circular_letter=$2
sender="Mariam Azab"

id=1

IFS=';'
while read -r name address date
do
	line=cat sed "s/<id>/$id/g; s/<name>/$name/g; s/<address>/$address/g; s/<date>/$date/g; s/<sender>/$sender/g" circular_letter.txt
	echo "$line" > output.txt
	echo "________________________________________________"
	id=` expr $id + 1 ` 
done<$data_file
