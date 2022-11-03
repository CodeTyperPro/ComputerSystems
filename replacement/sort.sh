#!/bin/sh

echo "give me a word"
read w

while test "$w" != "end"
do
  echo $w >> f.dat
  echo "give me a word"
  read w
done

if test -f f.dat
then
 sort f.dat
 rm f.dat
fi
