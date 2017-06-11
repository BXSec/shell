#!/bin/bash

# quote escape character

# -----------------------------------------------------
# 引用
var="'(]\\{}\$\""
echo $var
echo "$var"

echo 

IFS='\'
echo $var    # '(] {}$
echo "$var"  # '(]\{}$
echo '$var'

echo "------------------------------------------------"
# 轉義
echo -e "\042"

echo $'\n'
echo $'\a'

echo $'\042'

echo $'\x22'

quote=$'\042'
echo "$quote This is a quoted string, $quote and this lies outside the quotes."

triple_underline=$'\137\137\137'
echo "$triple_underline UNDERLINE $triple_underline"

ABC=$'\101\102\103\010'
echo $ABC

escape=$'\033'
echo "\"escape\" echoes as $escape"

echo "-------------------------------------------------"

echo \z
echo \\z
echo '\z'
echo '\\z'
echo "\z"
echo "\\z"

echo "------------------------------------------------"
# 變量中的轉義
#variable=\
#echo "$variable"
# 報錯，純轉義字符不能賦值給變量

variable=\
23skidoo
echo "$variable"

#variable=\ #<--透明的小空格
#echo "$variable"

echo "------------------------------------------------"
# 轉義空格
file_list="/bin/cat /bin/gzip /bin/more /usr/bin/less /usr/bin/emacs-20.7"
ls -l /usr/lib/gconv /usr $file_list
echo "================================================"
ls -l /usr/lib/gconv\ /usr\ $file_list


echo "------------------------------------------------"
# 續行功能
mkdir ./source
mkdir ./dest
touch ./source/s.tar

(cd ./source && tar cf - . ) | \
(cd ./dest && tar xpvf -)
