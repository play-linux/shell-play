#!/bin/bash

#------函数----------

#1.函数只允许返回正整数 0表示正常退出
#如果要像其他语言那样返回任意值则可以使用变量的方式
f1() {
    echo "hello,world"
}
f1 && echo $?

f2() {
    echo "hello,world"
    return 10
}
f2 && echo $?

s=0
add() {
    s=$(("$s" + "$1" + "$2"))
}
add 1 2
echo $s

#2.函数入参
f3() {
    for i in "$@"; do
        echo "$i"
    done
    for ((i = 0; i < $#; i++)); do
        printf "%d:%s\n" "$i" "OK"
    done
}
f3 "one" "two"

f4() {
    while [ ! -z $1 ]; do
        echo "$1"
        shift
    done
}
f4 "one" "two" "three"
