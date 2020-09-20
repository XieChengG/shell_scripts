#!/bin/bash

PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH

checkParams() {
    if [ $# -ne 2 ]; then
        echo "Error, Please input two int params\nUsage: sh $0 {num1} {num2}"
	exit 1
    fi
}

printTrapezoid() {
    local n=$1
    local m=$2
    for i in `seq $n $m`; do
        for j in `seq $i`; do
            echo -n '*'
        done
        echo
    done
}

main() {
    checkParams $@
    printTrapezoid $1 $2
}
main $@
