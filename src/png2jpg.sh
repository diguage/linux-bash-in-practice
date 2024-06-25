#!/usr/bin/env bash
#
# PNG to JPG
#

basedir=`pwd`
echo "basedir=${basedir}"

for  f in `ls $1/*.png`
do
  if [ ! -f "$f" ]; then
    continue
  fi

  # https://stackoverflow.com/a/965072/951836
  fullname=$(basename -- "$f")
  extension="${fullname##*.}"
  filename="${fullname%.*}"
  jpgname="${filename}.jpg"

  # https://linuxize.com/post/bash-check-if-file-exists/
  if [ -f "$jpgname" ]; then
    echo "$jpgname exists, skip..."
    continue
  fi

  echo "convert $fullname to $jpgname"
  docker run -v ${basedir}:/imgs dpokidov/imagemagick /imgs/${f} /imgs/${jpgname}

  echo ""
done

