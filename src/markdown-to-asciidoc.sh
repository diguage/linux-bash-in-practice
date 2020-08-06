#!/usr/bin/env bash
#
# Convert Markdown to AsciiDoc
#

#  https://matthewsetter.com/convert-markdown-to-asciidoc-withpandoc/

fullname=$(basename -- "$1")
filename="${fullname%.*}"
ascname="${filename}.adoc"

touch $ascname

pandoc --atx-headers \
    --verbose \
    --wrap=none \
    --toc \
    --reference-links \
    -f markdown+smart -t asciidoc $ascname \
    $1
