#!/bin/sh

FILE=$1

isNumber(){
	result=`echo "$1" | grep "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"`
	
	if test ${#result} -eq 0
	then
		return 0
	fi
	return 1
}

if test $# -eq 0
then
	echo "Please, pass the file via command line."
elif test -f $FILE
then
    valid=1
	while read line
	do
        total=`echo $line | wc -w`
        cont=0
        for i in $line
        do
            isNumber $i
            res=$?
            if test $res -eq 1
            then
                cont=`expr $cont + 1`
            fi
        done

        if test $total -ne $cont
        then 
            valid=0
        fi

        #echo "TOTAL = $total"
        #echo "TOTAL NUMBERS = $cont"

	done < $FILE

    if test $valid -eq 0
    then
        echo "Invalid data in the file. Please correct It :(!"
    else
        TEMP="temp.dat"
        if test -f $TEMP
        then 
            rm $TEMP
        fi

        while read line
        do
            record=""
            for i in $line
            do
                rem=`expr $i % 2`
                if test $rem -ne 0
                then
                    record="$record $i"
                fi
            done

		    echo " => " $record >> $TEMP # Temporary file
        done < $FILE

                #Update FILE

        paste -d " " $FILE $TEMP > $FILE
        echo "FILE MODIFIED: "
        cat $FILE

        if test -f $TEMP
        then 
            rm $TEMP
        fi
    fi
else
	echo "File not found."
fi