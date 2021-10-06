
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

systemctl stop firewalld 

systemctl disable firewalld

yum -y install vim git wget curl && yum -y update

yum -y groupinstall "Server with GUI"

systemctl set-default graphical.target

reboot

