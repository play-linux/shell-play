#!/bin/bash

#------循环-------------

#1. for
for i in {1..5}; do
    echo "$i"
done

for ((i = 0; i < 5; i++)); do
    echo "$i"
done

#2. while
count=0
while [ $count -lt 5 ]; do
    echo $count
    ((count += 1))
done

while ((count < 10)); do
    echo $count
    count=$((count + 1))
done

#3.循环还可以遍历文件
for i in /home/pb/temp/*; do
    if [ -d $i ]; then
        echo "$i is dir"
    elif [ -f $i ]; then
        echo "$i is file"
    else
        echo "unknow file type"
    fi
done
