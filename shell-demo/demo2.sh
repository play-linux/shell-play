#!/bin/bash

#--------------变量、环境变量相关-----------------

#1.内置变量
echo "file name is $0" #0就是执行sh文件的名字 双引号不转义
echo "total: $#"
for i in "$@";do
    printf "%s," "$i"
done
printf "\n"
echo "PID:$$"
echo "上条命令是否成功：$?" #0:没有错误 其他:有错误
echo "$PWD" "$USER" "$SHELL"

#2.局部变量
username="lyer"
function hello ()
{
    local username="xiaoming"
    echo $username
}
hello
echo $username

#3.只读变量
readonly age=18
echo $age

