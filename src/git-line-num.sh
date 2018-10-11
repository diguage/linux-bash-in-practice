#!/bin/bash
#
# 统计每个人提交的代码行数
#
# https://gist.github.com/amitchhajer/4461043[Count number of code lines in git repository per user] 
#

# git ls-files -z | xargs -0n1 git blame -w | perl -n -e '/^.*\((.*?)\s*[\d]{4}/; print $1,"\n"' | sort -f | uniq -c | sort -n

# git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr

git ls-files | while read f; do git blame --line-porcelain $f | grep '^author '; done | sort -f | uniq -ic | sort -n

git ls-files | while read f; do git blame -w -M -C -C --line-porcelain "$f" | grep '^author '; done | sort -f | uniq -ic | sort -n

git ls-files | while read f; do git blame -w -M -C -C --line-porcelain "$f" | grep -I '^author '; done | sort -f | uniq -ic | sort -n
