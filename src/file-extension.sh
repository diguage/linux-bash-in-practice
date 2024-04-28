#!/usr/bin/env bash
#
str="Hello World"
str2=" "
str3=""

if [ ! -z "$str" -a "$str" != " " ]; then
        echo "Str is not null or space"
fi

if [ ! -z "$str2" -a "$str2" != " " ]; then
        echo "Str2 is not null or space"
fi

if [ ! -z "$str3" -a "$str3" != " " ]; then
        echo "Str3 is not null or space"
fi

SOURCE="${BASH_SOURCE[0]}"
echo $SOURCE

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

filename=$(basename -- "$SOURCE")
extension="${filename##*.}"
filename="${filename%.*}"
echo $extension, $filename