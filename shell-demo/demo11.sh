#!/bin/bash

#------模式扩展-------

#1. ?*通配符 []扩展 正则
ls ????.sh
echo "---------------"

ls *.sh # xxx.sh
echo "---------------"

ls d*.sh #d开头的sh
echo "---------------"

ls *[0-9].sh #数字结尾的sh
echo "---------------"

ls .* #列出所有隐藏文件
echo "---------------"

ls **/*.go #匹配任意层级的文件
echo "---------------"

#2. {}大括号扩展
echo {0..9} {9..0} {00..20}
echo {a..z} {a..d}{1..4}
echo 200{0..21}年 {2020..2021}-{01..12}
echo {j{p,pe},pn}g
echo {1..10..2} #step=2

#3. ()命令扩展 解析命令
echo "$(date +%F)"
echo 1+2=$((1+2))