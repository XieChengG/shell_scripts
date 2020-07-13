#!/bin/bash
# Mass rename files
# Time:2020-06-20

PATH=$HOME/bin:$PATH
export PATH

DIR="/home/wwwroot"

chkDirExist() {
    if [ ! -d "$DIR" ]; then
	echo "Directory not found!"
	exit 1
    else
	cd $DIR
    fi
}

renameFiles() {
    FILENAMES=(`ls $DIR`)
    FIXED_STR="shift"
    for name in ${FILENAMES[@]}; do
	RANDOM_STR=`echo $name |awk -F "[_]" '{print $1}'`
	mv $name ${RANDOM_STR}_${FIXED_STR}.html
    done
}

main() {
    chkDirExist
    renameFiles
}
main
