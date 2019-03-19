#!/bin/bash
#
# 显示某文件中所有扩展名
#
# 2018-12-26 21:39:52
#

# https://stackoverflow.com/a/1842270/951836
find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u

# https://stackoverflow.com/a/23876063/951836
find . -type f -name "*.*" | grep -o -E "\.[^\.]+$" | grep -o -E "[[:alpha:]]{2,16}" | awk '{print tolower($0)}' | sort -u


ls | awk -F.  '{print $2}' | sort | uniq

# https://stackoverflow.com/a/1842366/951836
# 按照文件数量排序
find . -type f | sed -e 's/.*\.//' | sed -e 's/.*\///' | sort | uniq -c | sort -rn