#!/bin/bash
#
# 脚本参数处理：手动
#
# 示例： `./test.sh -f config.conf -v --prefix=/home`
#

for arg in "$*"
do
    echo "\$*" + $arg
done

for arg in "$@"
do
    echo "\$@" $arg
done

echo "\$0" $0
echo "\$1" $1
echo "\$2" $2
echo "\$3" $3
echo "\$4" $4
echo "\$5" $5
