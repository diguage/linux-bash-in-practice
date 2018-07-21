#!/bin/bash
#
#
# @author diguage
#
# https://unix.stackexchange.com/questions/146942/how-can-i-test-if-a-variable-is-empty-or-contains-only-spaces

appId="abc"

if [[ -z ${appId} ]]; then
  echo 'empty'
else
  echo 'not empty'
  echo $appId
fi
