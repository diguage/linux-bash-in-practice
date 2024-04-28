#!/usr/bin/env bash
#
# heredoc 声明
# http://tldp.org/LDP/abs/html/here-docs.html[Here Documents]

p="my is p"

doc1=$(cat<<EOF
AccountName1
AccountName2
AccountName1
$p
  AccountName2
AccountName3
EOF
)

doc2=<<EOF
AccountName1
$p
  AccountName2
AccountName3
EOF

echo $doc1
echo "---------------"
echo "$doc1"
echo "==============="
echo $doc2
echo "---------------"
echo "$doc2"

echo "$doc1" | tee -a test-heredoc.log
