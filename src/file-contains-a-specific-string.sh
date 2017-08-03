#!/bin/bash
#
# 文件中是否包含特定字符串
#
# http://stackoverflow.com/questions/11287861/how-to-check-if-a-file-contains-a-specific-string-using-bash[linux - How to check if a file contains a specific string using bash - Stack Overflow]

if grep -q "grep" "./file-contains-a-specific-string.sh"; then
  echo "contain grep";
fi


if `grep -q "grep" "./file-contains-a-specific-string.sh"; [ $? -eq 0 ]`; then
  echo "contain grep";
fi
