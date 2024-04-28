#!/usr/bin/env bash

for ((i=1; i<=10; i++))
do
  echo "i=" $i;
done

for i in {1..5} ; do echo "<meta http-equiv=\"refresh\" content=\"0;url=https://wordpress.diguage.com/archives/${i}.html\">" > ${i}.html; done