#!/usr/bin/env bash
#
# change https to git
#

# 获取当前路径
BASEDIR=$(pwd)

for  f in `ls -d */`
do
    echo -e "start to deal with $BASEDIR/$f\n"
    cd $BASEDIR/$f
    url=`git remote -v | grep origin | grep fetch | awk '{print $2}'`

    if [[ $url =~ ^git@.* ]]; then
        echo -e "It is a git url: $url\n"
    else
        # 将仓库地址从 HTTPS 转化为 git
        gurl=`echo $url | gsed 's/http[s]:\/\/\(.*\)\/\(.*\/.*\)/git@\1:\2/'`
        echo "converted url: $gurl\n"
        git remote set-url origin $gurl
    fi

    # 暂存代码修改
    echo "stash the update codes: $f"
    git stash

    # 暂存代码修改
    echo "change to master: $f"
    git switch master

    # 更新代码
    echo "pull code from master: $f"
    git pull -r origin master

    # 构建项目
    # 注意：注意：执行这个会让电脑卡住，只需要静态等待执行完毕即可
    echo "start to package the codes: $f"
    mvn clean package -Dmaven.test.skip=true -DtestSkips -Pproduct 1>/dev/null 2>&1 &
done

# 等所有的构建任务完成，大概需要等十几分钟
# 等所有的构建任务完成，大概需要等十几分钟
# 等所有的构建任务完成，大概需要等十几分钟
# 查查需要升级的 fastjson
find . -name "fastjson*.jar" -type f | awk -F"/" '{print $2, $NF}' | grep -v '83-jdsec.rc1\|83a-jdsec.rc1' | sort