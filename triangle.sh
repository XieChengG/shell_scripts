#!/bin/bash
# YangHui Triangle

PATH=$HOME/bin:$PATH
export PATH

. /etc/init.d/functions

read -p "Please input a number: " NUM
ARRAY[0]=1

# success output
successLogMsg() {
    echo "Successful!" $@
}

# failure output
failureLogMsg() {
    echo "Failure!" $@
}

# Check the num length
checkNumberLen() {
    if [ -z $NUM ]; then
	failureLogMsg "Error,Please input a integer number!"
	exit 1
    fi
}

# Check the type of input
checkTypeInput() {
    expr 2 + $NUM >/dev/null 2>&1
    RETVAL=$?
    if [ $RETVAL -ne 0 ]; then
	failureLogMsg "Error,Please input a integer number,not a string!"
	exit 2
    fi
}

# Check range of input between 0-9
checkRangeInput() {
    if [ $NUM -le 0 -o $NUM -gt 9 ]; then
	failureLogMsg "Error,Please input a integer number between 0-9!"
	exit 3
    fi
}

# First loop
firstLoop() {
    #echo "----------first loop---------"
    for ((j=$i;j>0;j--))
    do
	((ARRAY[$j]+=ARRAY[$j-1]))
    done
}

# Second loop
secondLoop() {
    #echo "----------second loop---------"
    for ((j=0;j<=$((NUM-i));j++))
    do
	if [ $NUM -le 6 ]; then
	    echo -en "\t"
	else
	    echo -en "   "
	fi
    done
}

# Three loop
threeLoop() {
    #echo "----------three loop---------"
    for ((j=0;j<=$i;j++))
    do
	if [ $NUM -le 6 ]; then
	    echo -en "\t"${ARRAY[$j]}"\t"
	else
	    echo -n ${ARRAY[$j]}"      "
	fi
    done
    echo
}

# Build triangle of YangHui
buildTriangle() {
    for ((i=0;i<$NUM;i++))
    do
	firstLoop
	secondLoop
	threeLoop
    done
}

# Main function
main() {
    checkNumberLen
    checkTypeInput
    checkRangeInput
    buildTriangle
    echo
}
main
