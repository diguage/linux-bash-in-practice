#!/usr/bin/env bash
#
# ./param-positional-argument.sh apple banana cantaloupe dates

n=3
echo ${!n}

echo ${@:$n:1}
