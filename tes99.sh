#!/bin/bash
echo " "

for i in {1..9}
do

        for j in {2..9}
        do
                gop=`expr $j \* $i`
                echo -n "$j X $i = $gop	"
        echo -n " "
	done

echo " "
done

