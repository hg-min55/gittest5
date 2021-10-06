a=$(echo $((RANDOM%19+8000)))
check=$(mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "select * from testnum where num = $a" | grep $a | wc -l)

until [ $check = 0 ]
do
echo "number : $a"
echo "in db row :$check"
echo "====================="
echo " "
a=$(echo $((RANDOM%19+8000)))
check=$(mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "select * from testnum where num = $a" | grep $a | wc -l)
done
echo $a
echo $a
echo "in db row :$check"
mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "insert into testnum values ($a)" 
mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "select * from testnum" 
cp /root/wp2.yml /root/wptest1.yml
sed -i "s/9999/$a/g" /root/wptest1.yml
docker stack deploy -c /root/wptest1.yml web2_$a
