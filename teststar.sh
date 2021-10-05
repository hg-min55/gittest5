#!/bin/bash


for ((a=10;a>0;a--))
do
	for ((b=2;b<12;b++))
	do
		if [ $a -ge $b ]
		then
			echo -n " "
		else
			echo -n "*"
		
		fi
	
	done
	echo "" 
done



