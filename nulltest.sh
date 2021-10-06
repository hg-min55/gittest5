
dbuser=$4
dbpass=$5
dbdb=$6

if [ "$4" == "" ]; then
dbuser="wordpress"
fi
if [ "$5" == "" ]; then
dbpass="wordpress"
fi
if [ "$6" == "" ]; then
dbdb="wordpress"
fi

echo $dbuser
echo $dbpass
echo $dbdb
