#!bin/bash
for i in 0 8
	do
	if [ $i -eq 0 ] 
	then

		for ((i;i<11;i+=2))
		do
				for ((b=0;b<(10-$i)/2;b++))
				do
					echo -n " "
				done
	
				for ((c=0;c<i;c++))
				do
					echo -n "*"
				done

			echo ""
		done

	elif [ $i -eq 8 ]
	then
		for ((i;i>0;i-=2))
		do
				for ((b=0;b<(10-$i)/2;b++))
				do
					echo -n " "
				done

				for ((c=0;i>c;c++))
				do
					echo -n "*"
				done
			echo " " 
		done
	fi
done
