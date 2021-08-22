#!/bin/bash

#--------c替换行   d删除行-----------

sed '1c hello' net.txt | head -n 5 #将1行替换为hello一行
sed '1,4c world' net.txt | head -n 5 #将[1,4]行都替换为world一行

echo "-------------------------"
sed '/localhost/c OK' net.txt | head -n 5 #真正匹配替换


echo "-------------"
sed '1,4d' net.txt | head -n 10 #删除[1,4]行
echo "--------------"
sed '/localhost/d' net.txt #删除带localhost的行


