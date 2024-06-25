#!/usr/bin/env bash
#
# 在文件第一行增加锚点，在增加之前做判断，没有则增加。
#

for file in *.adoc
do
  filename=$(basename -- "$file")
  # 文件名即锚点值
  filename="${filename%.*}"
  if ! grep -q $filename "$file"; then
    gsed -i "1 i\[#${filename}]" $file
  fi
done