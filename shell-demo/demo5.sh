#!/bin/bash

#------数组和map------

#1.数组定义
arr=(10 20 30 40 50)
echo "${arr[1]}" "${arr[4]}"

#2.遍历数组
for i in "${arr[@]}"; do
    printf "%d," "$i"
done
echo

for ((i = 0; i < ${#arr[@]}; i++)); do
    printf "%d->%d\n" "$i" "${arr[i]}"
done

#3.map  需要先使用declare -A声明变量为关联数组（支持索引下标为字符串） 普通数组则不需要声明即可使用
declare -A m
m["name"]="lyer"
m["age"]="18"
echo ${m["name"]} ${m["age"]}

#4. 遍历map
#遍历所有的key
for key in "${!m[@]}"; do
    echo $key ${m[${key}]}
done
#遍历所有的val
for val in "${m[@]}";do
    echo "$val"
done


