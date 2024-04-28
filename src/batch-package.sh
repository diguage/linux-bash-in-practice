#!/usr/bin/env bash
#
# 批量打包

dir=`pwd`;
echo "par: $dir";
for f in *; do
    if [ -d "$f" ]; then
        cd $f;
        echo "start to package $f"
        nohup mvn clean package -Dmaven.test.skip=true -DtestSkips -Pproduct,prod  1>/dev/null  2>&1  &
        echo ""
        cd $dir;
    fi
done