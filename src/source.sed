#!/usr/bin/env bash
#
# https://blog.csdn.net/solzy/article/details/21983271

:begin
/indent=0\]/,/\[subs="verbatim,quotes/ {
    /subs="verbatim,quotes/! {
        $! {
            N;
              b begin
        }
    }
    s/indent=0\]\n\[subs="verbatim,quotes/indent=0,subs="verbatim,quotes/;
}
