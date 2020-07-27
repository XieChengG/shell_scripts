#!/bin/bash

PATH=$HOME/bin:$PATH
export PATH

. /etc/init.d/functions

BASE_PATH=`dirname $0`
STAT_FILE="$BASE_PATH/mysql_repl_status.txt"

#sendEmail() {}

checkStat() {
    ARRAY=(`cat $STAT_FILE |grep -E "Slave_IO_Running|Slave_SQL_Running|Seconds_Behind_Master" |awk 'BEGIN{FS=":"}{print $2}'`)
    IO_STAT=${ARRAY[0]}
    SQL_STAT=${ARRAY[1]}
    BEHIND_TIME=${ARRAY[2]}
    if [ $IO_STAT == "Yes" -a $SQL_STAT == "Yes" -a $BEHIND_TIME -eq 0 ]; then
	action "Master-Slave is normal" /bin/true
    else
        action "Master-Slave is abnormal" /bin/false
    fi
}

main() {
    while true; do
	checkStat
	sleep 5
    done
}

main
