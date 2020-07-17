#!/bin/bash
# 获取所执行脚本的路径

CURRENT_DIR="$PWD"

echo '$0: '$0
echo "pwd: "`pwd`
echo "========================"
echo "scriptPath: "$(cd `dirname $0`;pwd)
