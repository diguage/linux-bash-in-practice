#!/usr/bin/env bash
#
# Convert Markdown to AsciiDoc
#
pandoc --standalone --columns=80 --atx-headers --to=asciidoc --output=asciidoc-result.adoc $1

echo "convert $1 to asciidoc-result.adoc"