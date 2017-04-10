#!/bin/bash
#
# 脚本参数处理：从命令行接受输入，以及请默认值
#
# 参考资料：
# http://stackoverflow.com/a/2642592/951836[shell - Read a variable in bash with a default value - Stack Overflow]
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html[Catching user input]
# http://tldp.org/LDP/Bash-Beginners-Guide/html/[Bash Guide for Beginners]

read -p "请输入东西：" index

index=${index:-1} # 默认值: 1

echo "刚输入的值：$index"
