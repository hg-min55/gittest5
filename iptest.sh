function dbselect() {
mysql aloedb -h 10.1.1.4 -uuser1 -puser1 -e "select $1 from vmtbl where vmname = '$2'" | tail -1
}

vmname=$1

ip2=$(dbselect vmip1 "$vmname")

echo $ip2

sed -i "s/'${ip2}:9100',//" /home/prometheus/prometheus/prometheus.yml
