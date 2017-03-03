#!/bin/bash
# 批量改名

wd=`pwd`
for f in `ls .`
do
  if test -f $f
  then
      continue;
  fi

  cd $wd/$f

  rename 's/[ ]+/_/g' *.jpg

  for file in ./*.jpg
  do
    num=`echo $file | grep -o '[0-9]\+'`
    # echo "${file}" "0${num}.jpg"
    mv "${file}" "${num}.jpg"
  done

  cd $wd
done
