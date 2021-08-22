#!/bin/bash

#1. 行数范围
sed -n '1 p' net.txt     #1
sed -n '1,3 p' net.txt   #[1,3]
sed -n '400,$ p' net.txt  #[1,]
sed -n '1,+3 p' net.txt #1行之后再打印3行

#2. 正则匹配范围
echo "-------------------"
sed -n '/50744/,/50670/ p' net.txt
sed -n '/50744/,+1 p' net.txt

echo "-------------"
sed -n '/127.0.0.1/ p' net.txt | wc -l



