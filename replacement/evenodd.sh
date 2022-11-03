#!/bin/sh
if test  $# -ne 1
then 
  echo I need a file name
  exit 1
fi
if test -f $1
then
 if test -f even.dat
 then
   rm even.dat
 fi
 if test -f odd.dat
 then
   rm odd.dat
 fi
 rownumber=1
 while read r
 do
   if test `expr $rownumber % 2` -eq 0
   then
       echo "$rownumber $r" >> even.dat
   else
       echo "$rownumber $r" >> odd.dat
   fi
   rownumber=`expr $rownumber + 1`
 done < $1
else
 echo not an existing file
fi
