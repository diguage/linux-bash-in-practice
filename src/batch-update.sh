#!/usr/bin/env bash
#
# 批量更新代码

dir=`pwd`;
echo "par: $dir";
for f in *; do
    if [ -d "$f" ]; then
        cd $f;
        echo "Update： $f";
        echo ""
        git stash
        git switch master
        git pull -r
        echo ""
        echo "Succeed to finish updating $f ..."
        echo ""
        echo ""
        echo ""
        cd $dir;
    fi
done