#!/usr/bin/env bash
#
# WebP to PNG
#

for  f in `ls $1/*.webp`
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
    continue
  fi

  echo "convert $fullname to $jpgname"
  ffmpeg -v fatal -i $fullname  $jpgname

  echo ""
done

