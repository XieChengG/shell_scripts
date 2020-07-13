#!/bin/bash
# The script is calculator
# Date:2020-06-14

PATH=$HOME/bin:$PATH
export PATH

# 用户输入两个数字
function inputNum() {
    read -p "num1:" a
    read -p "num2:" b
    
    NUM1=$a
    NUM2=$b
}

# 进行输入检测
function checkInput() {
    while true; do
	inputNum
        expr $NUM1 + 2 &>/dev/null
        RETVAL1=$?
        expr $NUM2 + 2 &>/dev/null
        RETVAL2=$?

        if [ -z $NUM1 -o -z $NUM2 ]; then  # 判断是否输入了
            echo "Input nothing, try again..."
        elif [ $RETVAL1 -ne 0 -o $RETVAL2 -ne 0 ]; then  # 判断输入的是否是整数
    	    echo "Please input two integer number!"
	else
	    break
        fi
    done
}

# 进行计算
function Compute() {
    echo "num1+num2=$((NUM1+NUM2))"
    echo "num1-num2=$((NUM1-NUM2))"
    echo "num1*num2=$((NUM1*NUM2))"
    echo "num1/num2=$((NUM1/NUM2))"
}

function main() {
    checkInput
    Compute
}
main
