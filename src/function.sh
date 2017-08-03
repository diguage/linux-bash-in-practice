#!/bin/bash
#
# 函数定义
#
# http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-8.html#ss8.1[BASH Programming - Introduction HOW-TO: Functions]
# http://tldp.org/LDP/abs/html/localvar.html[Local Variables]
# http://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function[Passing parameters to a Bash function - Stack Overflow]

fSum 3 2;

function fSum()
{
    echo $1,$2;
    return $(($1+$2));
}

fSum 5 7;

total=$(fSum 3 2);

# 返回值从 $? 获取
echo $total,$?;

# 测试是否支持递归
function testRecursive() {

  if [[ $1 -gt 0 ]]; then
    echo "go $1"
    testRecursive $(($1-1))
  else
    echo $1
  fi
}

testRecursive 3

# http://www.cnblogs.com/chengmo/archive/2010/10/17/1853356.html[linux shell 自定义函数(定义、返回值、变量作用域）介绍 - 程默 - 博客园]
# http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-8.html[BASH Programming - Introduction HOW-TO: Functions]
# 语法：
#
# [ function ] funname [()]
#
# {
#
#     action;
#
#     [return int;]
#
# }
#
# 说明：
# 1、可以带function fun()  定义，也可以直接fun() 定义,不带任何参数。
# 2、参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255
