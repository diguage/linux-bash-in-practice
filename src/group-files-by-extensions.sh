#!/bin/bash
#
# 根据扩展名分组显示文件。
#
# 2018-12-26 21:39:52
#
echo "在 Mac 下报错！"

for extension in `find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u`
do
    sum=$(find . -type f -name "*.$extension" -print0 | du --files0-from=- -hc | tail -1)
    echo "$extension ($sum)"
    echo $extension
    echo ""
done