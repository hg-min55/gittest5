detect=$(docker node ls | grep worker1 | wc -l)

while [ $detect = 0 ]
do
sleep 1
echo ready
detect=$(docker node ls | grep worker1 | wc -l)
done
echo done
