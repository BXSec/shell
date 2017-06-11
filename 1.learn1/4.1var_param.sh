#!/bin/bash

# 一 变量替换

a=375
hello=$a

# 强烈注意，会赋值的时候，等号前后一定不要有空格，
# 如果出现空格会怎么样？


# RIABLE =value"
#                   ^
#% 脚本将尝试运行一个"VARIABLE"的命令, 带着一个"=value"参数.

#  "VARIABLE= value"
#                      ^
#% 脚本将尝试运行一个"value"的命令, 
#+ 并且带着一个被赋值成""的环境变量"VARIABLE". 
#-------------------------------------------------------------------------

echo hello

echo $hello
echo ${hello}

echo "$hello"
echo "${hello}"

hello="A B  C      D"
echo $hello   # A B C D
echo "$hello" # A B  C      D
# 引用一個變量將保留其中的空白，當然如果是變量替換就不會保留了
# 在bash中，當變量中有空格 TAB之類的字符時候，如果要打印這些字符，需要用雙引號進行引用 "$hello" 

echo '$hello' # $hello

hello=
echo "\$hello (null value) = $hello"

var1=21 var2=22 var3=$V3
echo "var1=$var1  var2=$var2  var3=$var3"

# -------------------------------------------------
numbers="one two three"

other_numbers="1 2 3"


# 如果在變量中存在空白，那麼就必須加上引號
# other_numbers=1 2 3
echo "numbers = $numbers"
echo "other_numbers = $other_numbers"
# 也可以採用將空白轉義的方法
mixed_bag=2\ ---\ Whatever

echo "$mixed_bag"
echo "----------------------------------------------"
# 變量賦值
a=23
echo $a
b=$a
echo $b

a='echo Hello\!'
echo $a

a='ls -l'
echo $a
echo
echo "$a"

#exit 0

echo "-----------------------------------------"
# 變量不區分類型
a=2334
let "a += 1"
echo "a = $a"
echo 

b=${a/23/BB} #將"23"替換成"BB"

echo "b = $b"
declare -i b
echo "b = $b"

let "b += 1"
echo "b = $b"
echo 

c=BB34
echo "c = $c"
d=${c/BB/23}

echo "d = $d"
let "d += 1"
echo "d = $d"
echo

# null變量會如何
e=""
echo "e = $e"
let "e += 1"
echo "e = $e"
echo

# 沒有聲明變量
echo "f = $f"
let "f += 1"
echo "f = $f"
echo

echo "----------------------------------------------"
# 特殊變量
# 位置參數
# bash test.sh 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10
echo

echo "The name of this script is \"$0\""
echo "The name of this script is \"'basename $0'\"."

echo 

if [ -n "$1" ]
then
echo "Parameter #1 is $1"
fi


if [ -n "$2" ]
then
echo "Parameter #2 is $2"
fi


if [ -n "$3" ]
then
echo "Parameter #3 is $3"
fi


if [ -n "$4" ]
then
echo "Parameter #4 is $4"
fi


if [ -n "$5" ]
then
echo "Parameter #5 is $5"
fi


if [ -n "$6" ]
then
echo "Parameter #6 is $6"
fi


if [ -n "$7" ]
then
echo "Parameter #7 is $7"
fi


if [ -n "$8" ]
then
echo "Parameter #8 is $8"
fi


if [ -n "$9" ]
then
echo "Parameter #9 is $9"
fi


if [ -n "${10}" ]
then
echo "Parameter #10 is ${10}"
fi

echo "All the command-line parameters are: "$*""
if [ $# -lt "$MINPARAMS" ]
then
	echo
	echo "This script needs at least $MINPARAMS command-line arguments!"
fi

