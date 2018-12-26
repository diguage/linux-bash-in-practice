#!/bin/bash
#
# init Antora project
#

mkdir -p modules/ROOT/assets/attachments
touch modules/ROOT/assets/attachments/.gitkeep

mkdir -p modules/ROOT/assets/images
touch modules/ROOT/assets/images/.gitkeep

mkdir -p modules/ROOT/assets/videos
touch modules/ROOT/assets/videos/.gitkeep

mkdir -p modules/ROOT/examples
touch modules/ROOT/examples/.gitkeep

mkdir -p modules/ROOT/pages
touch modules/ROOT/pages/index.adoc

touch modules/ROOT/nav.adoc
echo "* xref:index.adoc[Home]" >> modules/ROOT/nav.adoc

touch ./antora.yml
cat >./antora.yml <<EOL
name: 
title: 
version: latest
start_page: index.adoc
nav:
- modules/ROOT/nav.adoc
EOL
