#!/bin/bash
# 条件判断
# http://www.cnblogs.com/emanlee/p/3583769.html[shell bash判断文件或文件夹是否存在]
# http://tldp.org/LDP/abs/html/fto.html[File test operators]
#
# http://blog.csdn.net/ithomer/article/details/6836382[Linux 之 shell 比较运算符 - IT-Homer - 博客频道 - CSDN.NET]
# http://www.cnblogs.com/emanlee/p/3583769.html[shell bash判断文件或文件夹是否存在 - emanlee - 博客园]

#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹
if [ ! -d "/myfolder" ]; then
  mkdir /myfolder
fi

#shell判断文件,目录是否存在或者具有权限


folder="/var/www/"
file="/var/www/log"

count=99
if [ $count -eq 100 ]
then
  echo "Count is 100"
else
  if [ $count -gt 100 ]
  then
    echo "Count is greater than 100"
  else
  echo "Count is less than 100"
  fi
fi

# -n 判断一个变量是否有值
if [ -n "$var" ]; then
  echo "$var is not empty"
  exit 0
fi

# 判断一个变量是否为空
if [ -z "$GOPATH" ]; then
  export GOPATH=$wd
else
  export GOPATH=$wd:$GOPATH
fi

# 判断两个变量是否相等
if [ "$var1" = "$var2" ]; then
  echo '$var1 eq $var2'
else
  echo '$var1 not eq $var2'
fi

echo "Is it morning? Please answer yes or no."
read YES_OR_NO
if [ "$YES_OR_NO" = "yes" ]; then
  echo "Good morning!"
elif [ "$YES_OR_NO" = "no" ]; then
  echo "Good afternoon!"
else
  echo "Sorry, $YES_OR_NO not recognized. Enter yes or no."
  exit 1
fi
exit 0
