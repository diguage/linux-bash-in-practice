#!/usr/bin/env bash
#
# Convert HTML to AsciiDoc
#

pandoc --wrap=none -f html -t asciidoc $1 >> result.adoc

echo "convert html to result.adoc"
