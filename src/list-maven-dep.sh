# 统计应用依赖情况
# D瓜哥 · https://www.diguage.com
base_dir=`pwd` && for f in `ls`
do
    if [ -d $base_dir/$f ]; then
        echo -n "start to deal with ··· $f ···\n"
        cd $base_dir/$f;
        rm -f "dep.txt"
        rm -f "$base_dir/$f.err"
        # 保存改动代码
        git stash 1>/dev/null 2>"$base_dir/$f-stash.err"
        # 切换到 master 分支
        git switch master 1>/dev/null 2>"$base_dir/$f-switch.err"
        # 拉取最新代码
        git pull origin master 1>/dev/null 2>"$base_dir/$f-pull.err"
        # 分析依赖并提取依赖列表
        mvn dependency:tree  2>"$base_dir/$f-mvn.err" \
            | grep -E " \+- | \|  \|" \
            | awk -F" " '{print $NF}' \
            | sort \
            | uniq \
            | awk -F":" '{print $1":"$2":"$4}' \
            | sed "s/$/ $f/g" 1>"dep.txt" 2>"$base_dir/$f-sed.err"
    fi

    cd $base_dir;
done

# 按照 使用数量、依赖名称、应用名称 进行列表展示
# D瓜哥 · https://www.diguage.com
find . -name "dep.txt" \
    | xargs cat \
    | awk '{ CNT[$1]++; APP[$1] = APP[$1] ? APP[$1]"#"$2:$2 } END { for (k in CNT) printf "%s %s %s \n", k, CNT[k], APP[k] }' \
    | awk '{ printf "%3s, %-65s, %s \n", $2, $1, $3 }' \
    | sort -k 2 \
    | sed "s/^/\n/g"\
    | sed "s/#/\n                                                                      ,, /g"\
    | tee "$base_dir/deps.csv"

