#!/bin/bash

#---------s文本替换指令--------

#1. g表示替换全部
sed 's/127.0.0.1/localhost/g' net.txt | sed -n '/localhost/ p'
echo "---------------------------"

#2. -i代表对源文件进行修改 不会产生输出
sed -i 's/127.0.0.1/localhost/g' net.txt
echo "---------------------------"

#3. 行前行尾添加内容
sed 's/^/@/g' net.txt | head -n 3
sed 's/$/#/g' net.txt | head -n 3
echo "---------------------------"

#4. 替换指定的行
sed '1,3s/localhost/127.0.0.1/g' net.txt | head -n 5 #只在[1,3]里面做替换
sed '3s/localhost/127.0.0.1/g' net.txt | head -n 5 #只在第3行作替换
echo "---------------------------"

#5. 只替换一行里面匹配到的指定的列
sed 's/localhost/127.0.0.1/1' net.txt | head -n 5 #只替换匹配到的第1列
sed 's/localhost/127.0.0.1/2g' net.txt | head -n 5 #替换匹配到的第2列以及之后所有列
echo "---------------------------"

#6. 修饰匹配到的内容 &表示匹配到的内容
sed 's/localhost/"&"/g' net.txt | head -n 5 #将匹配到的都用""包裹 
sed 's/.*/"&"/g' net.txt | head -n 5 #将每行都用""包裹 


