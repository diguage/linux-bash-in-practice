#!/usr/bin/env bash
#
# Loop for find
#

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "BASEDIR=${BASEDIR}"

# https://stackoverflow.com/a/9612232
# Make sure globstar is enabled
# shopt -s globstar
# for i in **/*.jpg; do # Whitespace-safe and recursive
#     fileName="${BASEDIR}${i}"
#     echo $fileName
# done

BASEDIR=$( pwd )

images=()
# https://stackoverflow.com/a/9612560
find ${BASEDIR} -name "*.jp*g" -print0 | while read -d $'\0' file
do
    # echo "file=$file, parent=${parent}, fileBaseName=${fileBaseName}, fileName=${fileName}, extension=${extension}"
    for item in 'goodbye-2019-hello-2020' 'wx-jikerizhi-qrcode.jpg' 'wxpay.jpg' 'avatar.jpg' '-mark.jpg' '-mark.jpeg' ;
    do
        
        # https://stackoverflow.com/a/229606
        if [[ "${file}" == *"${item}"* ]]; then
            echo "continued: $file"
            # https://linuxize.com/post/bash-break-continue/
            # https://blog.csdn.net/focus_lyh/article/details/112319193
            continue 2
        fi
    done

    # https://stackoverflow.com/a/1951523
    images+=("$file")

    # https://stackoverflow.com/a/965072
    fileBaseName=$(basename -- "$file")
    extension="${fileBaseName##*.}"
    fileName="${fileBaseName%.*}"
    # https://unix.stackexchange.com/a/39545
    parent=$(dirname "${file}")
    # echo "file=$file, parent=${parent}, fileBaseName=${fileBaseName}, fileName=${fileName}, extension=${extension}"

    markFileBaseName="${fileName}-mark.${extension}"
    
    echo "start to convert to ${fileBaseName} -> ${markFileBaseName}"
    
    # By default, container will run convert command
    docker run --rm -v ${parent}:/imgs -v ${BASEDIR}:/fonts dpokidov/imagemagick:latest-ubuntu -compress JPEG2000 -strip -thumbnail 960 -quality 75 -font /fonts/SourceCodePro-Semibold.otf -pointsize 30 -gravity southeast -fill "#DE282A" -draw 'text 15,18 "https://www.diguage.com"' "/imgs/${fileBaseName}" "/imgs/${markFileBaseName}"
done

# https://stackoverflow.com/a/9612560
for file in "${images[@]}"
do

    # https://stackoverflow.com/a/965072
    fileBaseName=$(basename -- "$file")
    extension="${fileBaseName##*.}"
    fileName="${fileBaseName%.*}"
    # https://unix.stackexchange.com/a/39545
    parent=$(dirname "${file}")
    # echo "file=$file, parent=${parent}, fileBaseName=${fileBaseName}, fileName=${fileName}, extension=${extension}"

    markFileBaseName="${fileName}-mark.${extension}"
    
    if [ -f "${parent}/${markFileBaseName}" ]; then
        rm -rf "${file}"

        mv "${parent}/${markFileBaseName}" "${file}"

        echo "marked ${file}"
        
        # 删除多余的图片
        if [ -f "${parent}/${fileName}.png" ]; then
            rm -rf "${parent}/${fileName}.png"
        fi
    fi
done

