#!/bin/sh

s=0

if test $# -ne 0
then
 data=$*
else
 data=`cat`
fi

for i in `echo $data`
 do
  s=`expr $s + $i`
 done

echo $s
