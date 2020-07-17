#!/bin/bash
# Check host is online

PATH=$HOME/bin:$PATH
export PATH

. /etc/init.d/functions

# 检测当前用户是否是 root
checkUser() {
    CURRENT_USER=$USER
    if [ $CURRENT_USER != "root" ]; then
	echo "Error! Current user is not root!"
	exit 1
    fi
}

# 检测在线的机器
chkHostOnline() {
    for IP in 10.0.0.{90..100}; do
	RES=$(ping -c 1 -i 1 -w 2 $IP |grep "received"|awk -F "[, ]+" '{print $4}')
	if [ $RES -gt 0 ]; then
	    action "$IP is online" /bin/true
	else
	    action "$IP is offline" /bin/false
	fi
    done
}

# 并发的检测在在线的机器
concurrenceChk() {
    local IP="10.0.0."
    for N in $(seq 254)
    do
	{
	    ping -c 2 -W 2 $IP$N &>/dev/null
	    RETVAL=$?
	    if [ $RETVAL -eq 0 ]; then
		action "$IP$N is online" /bin/true
	    else
		action "$IP$N is offline" /bin/false
	    fi
	}&
    done
}

# 主函数
main() {
    checkUser
    #chkHostOnline
    concurrenceChk
}
main
