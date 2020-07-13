#!/bin/bash
# Mass create files with for loop
# Time: 2020-06-20

PATH=$HOME/bin:$PATH
export PATH

DIR="/home/wwwroot"

chkDirExist() {
    if [ ! -d "$DIR" ]; then
	mkdir -p $DIR
	cd $DIR
    fi
}

massCreateFiles() {
    FIXED_STR="shift"
    RANDOM_STR=""
    for str in {1..10}; do
	RANDOM_STR=$(openssl rand -hex 10 |cut -c 1-10 |tr '0-9' 'a-z')
	touch ${RANDOM_STR}_${FIXED_STR}.html
    done
}

main() {
    chkDirExist
    massCreateFiles
}
main
