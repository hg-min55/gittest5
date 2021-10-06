

expect << EOF
spawn ansible $1 -m shell -a "$2" -k
expect "password"
sleep 1
send "test123\n"
sleep 1
send "test123\n"
expect eof
EOF
