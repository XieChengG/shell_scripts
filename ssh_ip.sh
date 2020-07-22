#!/bin/bash

PATH=$HOME/bin:$PATH
export PATH

IP_FILE="/root/ip_list.txt"
IP_LIST=(`cat $IP_FILE`)

loopSshIp() {
    i=0
    while ((i<${#IP_LIST[@]})); do
	HOST_IP=${IP_LIST[i]}
	ssh $HOST_IP 'hostname'
	let i++
    done
}

main() {
    loopSshIp
}
main
