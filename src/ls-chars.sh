#!/usr/bin/env bash
# ./ls-chars.sh 'Source Han Sans SC' -- 查看字体文件中内包含的字符
# fc-list | grep 'Source Han Sa' -- 查看系统内包含什么字体
for range in $(fc-match --format='%{charset}\n' "$1"); do
    for n in $(seq "0x${range%-*}" "0x${range#*-}"); do
        printf "%04x\n" "$n"
    done
done | while read -r n_hex; do
    count=$((count + 1))
    printf "%-5s\U$n_hex\t" "$n_hex"
    [ $((count % 10)) = 0 ] && printf "\n"
done
printf "\n"


# for range in $(fc-match --format='%{charset}\n' "$1"); do
#     for n in $(seq "0x${range%-*}" "0x${range#*-}"); do
#         printf "%04x\n" "$n"
#     done
# done

# for range in $(fc-match --format='%{charset}\n' 'Source Han Sans SC'); do
#     for n in $(seq "0x${range%-*}" "0x${range#*-}"); do
#         printf "%04x\n" "$n" | tee -a /tmp/f-sans-sc
#     done
# done