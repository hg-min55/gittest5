mkdir /root/backup
mkdir /root/backup/setting
mkdir /root/backup/yml
mkdir /root/backup/sh

firewall-cmd --list-all > /root/backup/setting/firewallset
cat /etc/sysconfig/network-scripts/ifcfg-ens33 >/root/backup/setting/ifcfg-ens33

cat /etc/sysconfig/network-scripts/ifcfg-ens32 >/root/backup/setting/ifcfg-ens32

cat /etc/sysconfig/network-scripts/ifcfg-br01 >/root/backup/setting/ifcfg-br01

cat /home/prometheus/prometheus/prometheus.yml> /root/backup/setting/prometheus.yml



cp /root/*.sh /root/backup/sh/

cp /root/aa/sample/*.yml /root/backup/yml/

cp /root/aa/sample/*.sh /root/backup/sh/

cp -r /root/aa/sample/index /root/backup/sh/

tar cvf backup_${HOSTNAME}_fin.tar /root/backup

rm -rf /root/backup

