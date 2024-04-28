#!/usr/bin/env bash
#
while : ; do
  "$@"
  if [ $? -eq 0 ]; then
    break;
  fi
done