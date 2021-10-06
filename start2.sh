yum install -y qemu-kvm libvirt virt-install virt-manager virt-viewer openssh-askpass

yum -y install libguestfs-xfs 

export LIBGUESTFS_BACKED=direct

yum install libguestfs-tools

systemctl enable firewalld

systemctl restart firewalld

firewall-cmd --permanent -add-masquerade

firewall-cmd --reload

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

systemctl enable docker 
systemctl restart docker

curl  -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

