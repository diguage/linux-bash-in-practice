#!/usr/bin/env bash
#
# 大写转小写
#

a="This Is a UPPERcase STinG."

echo "tr::"
echo "$a" | tr '[:upper:]' '[:lower:]'


echo "awk::"
echo "$a" | awk '{print tolower($0)}'


echo "Bash4.0"
echo "${a,,}"

echo "Perl"
echo "$a" | perl -ne 'print lc'

echo "sed::"
echo "$a" | gsed 's/.*/\L&/'

# //To lowercase//////////
string="A FEW WORDS"
echo "${string,}"
# a FEW WORDS
echo "${string,,}"
# a few words
echo "${string,,[AEIUO]}"
# a FeW WoRDS

# //To uppercase//////////
echo "To uppercase"
string="a few words"
echo "${string^}"
# A few words
echo "${string^^}"
# A FEW WORDS
echo "${string^^[aeiou]}"
# A fEw wOrds

string="A Few Words"
declare -u string
string=$string; echo "$string"
# A FEW WORDS

# Capitalize (undocumented)
echo Capitalize
string="a few words"
declare -c string
string=$string
echo "$string"
# A few words

# Title case:
echo "Title case"
string="a few words"
string=($string)
string="${string[@]^}"
echo "$string"
# A Few Words

declare -c string
string=(a few words)
echo "${string[@]}"
# A Few Words
