#!/bin/bash

#---------字符串-----------

#1.字符串拼接
username="lyerabcd"
s1="hello "$username
echo "$s1"

#2.获取长度
echo "${#username}"

#3.获取子串
echo ${username:1} #索引1之后全部
echo ${username:1:2} #索引1开始取2个
echo ${username:1:-2} #[1,-2)
echo ${username: -2} #取倒数最后2个

#4.改变大小写
echo ${username^^} #大写
echo ${username,,} #小写

