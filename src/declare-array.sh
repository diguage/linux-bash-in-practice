#!/usr/bin/env bash
#
# 数组声明以及遍历

## 声明一个数字变量，可以带引号
declare -a files=(`ls *.sh`)

# 获取数组长度
arraylength=${#files[@]}

# 遍历数组，获取下标以及各个元素
for (( i=1; i<${arraylength}+1; i++  ));
do
    echo $i  ": " ${files[$i-1]}
done
