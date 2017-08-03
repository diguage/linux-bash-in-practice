#!/bin/bash
# 条件判断
# http://www.cnblogs.com/emanlee/p/3583769.html[shell bash判断文件或文件夹是否存在]
# http://stackoverflow.com/questions/24694384/check-if-a-condition-is-false[linux - Check if a condition is false - Stack Overflow]

#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹
if [ ! -d "/myfolder" ]; then
  mkdir /myfolder
fi

#shell判断文件,目录是否存在或者具有权限


folder="/var/www/"
file="/var/www/log"

# -x 参数判断 $folder 是否存在并且是否具有可执行权限
if [ ! -x "$folder"]; then
  mkdir "$folder"
fi

# -d 参数判断 $folder 是否存在
if [ ! -d "$folder"]; then
  mkdir "$folder"
fi

# -f 参数判断 $file 是否存在
if [ ! -f "$file" ]; then
  touch "$file"
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

if [ 0 -eq 2 ]; then
  echo true;
else
  echo false;
fi

if [ 0 -ne 2 ]; then
  echo true;
else
  echo false;
fi

# 字符串使用 = ，数字使用 -eq 等

if (( $i == 0 )); then
  echo "i is 0"
else
  echo "i is unequal 0"
fi
