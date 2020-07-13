#!/bin/bash
# Create 10 numbers of counts 
# with random char of 8 length
# for password
# Time:2020-06-29

PATH=$HOME/bin:$PATH
export PATH

. /etc/init.d/functions

PWD_FILE="$PWD/count.txt"

beginAddUserAccounts() {
    echo -n "begin create user accounts"
    for ((i=0;i<10;i++)); do
	echo -n '.'
	sleep 1
    done
    echo
}

userAdd() {
    for user in user{01..10}; do
	PASSWORD=`openssl rand -hex 10 |cut -c 1-8 |tr '0-9' 'a-z'`
	id $user >/dev/null 2>&1
	RETVAL=$?
	if [ $RETVAL -ne 0 ]; then
	    useradd $user && echo $PASSWORD |passwd --stdin $user
	    echo -e "username:$user\tpassword:$PASSWORD" >>$PWD_FILE
	    action "create user $user successfully!" /bin/true
	else
	    continue
	fi
    done
}
main() {
    beginAddUserAccounts
    userAdd
    echo -n "User accounts generate over"
    for ((i=0;i<10;i++)); do
	echo -n "="
	sleep 1
    done
    echo
    echo "accounts info below"
    cat $PWD_FILE
}
main
