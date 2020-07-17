#!/bin/bash

PATH=$HOME/bin:$PATH
export PATH

PHRASE="For an introductory tutorial on how to use the Blue Ocean feature of Jenkins"
ARRAY=($PHRASE)

countAlpha() {
    for WORD in ${ARRAY[@]}; do

	# 判断字符串变量的长度的 3 种方法
	# CHAR_LEN=${#WORD}
	# CHAR_LEN=`echo $WORD |wc -L`
	CHAR_LEN=`expr length $WORD`

	if [ $CHAR_LEN -le 6 ]; then
	    echo $WORD
	fi
    done
}

main() {
    countAlpha
}
main
