#!/bin/bash
#
# 脚本参数处理：手动
#
# 示例： `./test.sh -f config.conf -v --prefix=/home`
#

for arg in "$*"
do
    echo $arg
done

for arg in "$@"
do
    echo $arg
done
