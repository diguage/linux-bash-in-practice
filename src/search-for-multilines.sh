#!/usr/bin/env bash
#
# 跨行搜索
#

# https://stackoverflow.com/a/7167115/951836

grep -Pazo "(?s)<artifactId>mysql-connector-java</artifactId>\s*\N\s*?<version>5....." pom.xml

# `$ grep -Pzo "(?s)^(\s*)\N*main.*?{.*?^\1}" *.c`

# Explanation:

# `-P` activate perl-regexp(https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions) for grep (a powerful extension of regular expressions)

# `-z` suppress newline at the end of line, substituting it for null character. That is, grep knows where end of line is, but sees the input as one big line.

# `-o` print only matching. Because we're using `-z`, the whole file is like a single big line, so if there is a match, the entire file would be printed; this way it won't do that.

# In regexp:

# `(?s)` activate `PCRE_DOTALL`, which means that `.` finds any character or newline

# `\N` find anything except newline, even with `PCRE_DOTALL` activated

# `.*?` find `.` in non-greedy mode, that is, stops as soon as possible.

# `^` find start of line

# `\1` backreference to the first group `(\s*)`. This is a try to find the same indentation of method.

# As you can imagine, this search prints the main method in a C (`*.c`) source file.
