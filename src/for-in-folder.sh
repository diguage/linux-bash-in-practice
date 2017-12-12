#!/bin/bash

for  f in `ls .`
do
  echo $f
done

for  f in `ls ./*\).mp3`
do
  echo "$f"
done


#!bin/sh
for file in ./*
do
    if test -f $file
    then
        echo $file 是文件
    fi
    if test -d $file
    then
        echo $file 是目录
    fi
done

#!bin/sh
for file in ./*
do
    if test -f $file
    then
        echo $file 是文件
    else
        echo $file 是目录
    fi
done

#!bin/sh
for file in ./*\).mp3
do
  echo $file
done
