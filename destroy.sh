function dbselect() {
mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "select $1 from vmtbl where vmname = '$2'" | tail -1
}
vmname=$1

vmname1=$(dbselect vmname "$vmname" )
hostname=$(dbselect vmhostname "$vmname")
service=$(dbselect service_name "$vmname")
ip=$(dbselect vmip2 "$vmname")
port=$(dbselect vmport "$vmname")
a=$(dbselect service_name "$vmname")
b=$(dbselect vmhostname "$vmname")
stack="$a-$b"
ip2=$(dbselect vmip1 "$vmname")

echo $vmname1
echo $hostname
echo $service
echo $ip
echo $port
echo $a
echo $b

virsh destroy $vmname1
virsh undefine $vmname1

rm -rf /vmimg/${vmname1}.qcow2

docker stack rm wp-$b 
docker node rm ${hostname} -f 
sed -i "/$ip/d" /root/aa/sample/portforward.sh
sed -i "/$ip/d" /etc/sysconfig/network-scripts/ifcfg-ens32
sed -i "/$ip2/d" /etc/ansible/hosts

iptables -F

source /root/aa/sample/portforward.sh

mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "delete from vmtbl where vmname = '$vmname1'"

systemctl restart network

until [ $? = 0 ]
do
systemctl restart network
done


sed -i "s/'${ip2}:9100','${ip2}:8080',//g" /home/prometheus/prometheus/prometheus.yml

systemctl restart prometheus

sleep 1

sed -i "/${ip2}/d" /etc/ansible/hosts

