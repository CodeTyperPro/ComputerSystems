#!/bin/sh
prim(){
  n=2
  while test `expr $1 % $n` -ne 0
  do
    n=`expr $n + 1`
  done
  test $1 -eq $n
  return $?
}

for i in `seq $1 $2`
do
  if
    prim $i
  then 
    echo "$i prim"
  fi
done

