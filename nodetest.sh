a=$(docker node ls | wc -l )
b=$(expr $a + 1 )
echo $a
echo $b

until [ "$a" == $b  ] 
do
echo loading
sleep 1
done
