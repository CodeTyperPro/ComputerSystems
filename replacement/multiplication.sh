#!/bin/sh

for i in `seq 10`
do
  for j in `seq 10`
  do
    echo -n " " `expr $i \* $j`
  done
  echo 
done
