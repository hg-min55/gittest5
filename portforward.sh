iptables -t nat -A PREROUTING -p tcp -i ens32 -d 10.1.1.95 --dport 80 -j DNAT --to 192.168.1.95:8008
iptables -t nat -A PREROUTING -p tcp -i ens32 -d 10.1.1.95 --dport 4200 -j DNAT --to 192.168.1.95:4200
