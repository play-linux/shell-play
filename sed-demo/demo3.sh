#!/bin/bash

#------a/i 插入指令---------

#a:行后面追加 i:行前面插入
sed '2a hello,world' net.txt | head -n 5
echo "----------------------------------"
sed '2i hello,world' net.txt | head -n 5
echo "----------------------------------"
sed '1,4a hello,world' net.txt | head -n 10 # [1,4]每行后面插入

#正则匹配到的行也可以插入
sed '/localhost/a hello,world' net.txt | head -n 10


