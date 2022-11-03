file=$1
LO=`cat $file | tr "[a-z]" "[A-Z]"`
echo -e `cat $file`
echo -e $LO