#!/bin/bash

cpurate=$(mpstat | tail -1 | gawk '{print 100-$13}')
inst_num=$(virsh list --all | wc -l)
inst_num1=`expr $inst_num - 3`

mysql aloedb -h 10.1.1.4 -u user1 -puser1 -e "UPDATE hosttbl SET cpurate = '$cpurate' WHERE  hostname = '$HOSTNAME'"
mysql aloedb -h 10.1.1.4 -u user1 -puser1 -e "UPDATE hosttbl SET instance_num = '$inst_num1' WHERE  hostname = '$HOSTNAME'"

