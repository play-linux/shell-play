#!/bin/bash

#-----case------

printf "输入[1,2,3,4,5]中的一个: "
read -r code

case $code in
1)
    echo "one"
    ;;
2)
    echo "two"
    ;;
3)
    echo "three"
    ;;
4)
    echo "four"
    ;;
5)
    echo "five"
    ;;
*)
    echo "other"
    ;;
esac
