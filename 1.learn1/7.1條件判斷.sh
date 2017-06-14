#!/bin/bash
# 一 條件測試結構 []與test命令等價，出於效率考慮，將其作爲內建命令

# 逐字節比較a b兩個文件是否相同
if cmp a b &> /dev/null # 禁止輸出
then echo "Files a and b are identical."
else echo "Files a and b differ."
fi

# 非常有用的"if-grep"結構
if grep -q Bash file
then echo "FIle contains at least one occurrence of Bash."
fi

word=Linux
letter_sequence=inu
if echo "$word" | grep -q "$letter_sequence"
# "-q" 選項是用來禁止輸出的。
then
echo "$letter_sequence found in $word"
else
echo "$letter_sequence not found in $word"
fi

# 將打印Command failed
if COMMAND_WHOSE_EXIT_STATUS_IS_0_UNLESS_ERROR_OCCURRED
then echo "Command succeeded."
else echo "Command failed."
fi

echo "------------------------------------------------"
# 2.多級比較 嵌套分支判斷
if echo "Next *if* is part of the comparison for the first *if*."
then 
	echo "Hello if"
	if [[ $comparison="integer" ]]
		then (( a < b ))
		echo "a < b"
	else
		echo '$a < $b'
		[[ $a < $b ]]
	fi
echo '$a is less than $b'
fi

echo "-----------3.真假判斷----------------------------"
# 3.真假判斷
echo 

echo "Testing \"0\""
if [ 0 ]
then
	echo "0 is true."
else
	echo "0 is false."
fi

echo

echo "Testing \"1\""
if [ 1 ]
then echo "1 is true."
else
	echo "1 is false."
fi

echo

echo "Testing \"-1\""
if [ -1 ]
then echo "-1 is true."
else echo "-1 is false."
fi

echo

echo "Testing \"xyz\""
if [ xyz ]
then echo "Random string is true."
else echo "Random string is false."
fi

echo

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then echo "Uninitialized variable is true."
else echo "Uninitialized variable is false."
fi

echo

xyz=      # 初始化了，但是賦null值
echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then echo "null variable is true."
else echo "null variable is false."
fi

echo

# 什麼時候"false"爲真
echo "Testing \"false\""
if [ "false" ]
then echo "\"false\" is true."
else echo "\"false\" is false."
fi

echo

echo "Testing \"\$false\""
if [ "$false" ]
then echo "\"\$false\" is true."
else echo "\"$false\" is false."
fi

echo 


echo "----------4.(())結構------------------------"
(( 0 ))
echo "Exit status of \"(( 0 ))\" is $?."    #1

(( 1 ))
echo "Exit status of \"(( 1 ))\" is $?."  #0

(( 5 > 4))
echo "Exit status of \"(( 5 > 4 ))\" is $?." # 0

(( 5 > 9 ))
echo "Exit status of \"(( 5 > 9 ))\" is $?." # 1

(( 5 - 5 ))   # 0
echo "Exit status of \"(( 5 - 5 ))\" is $?." #1

(( 5 / 4 ))
echo "Exit status of \"(( 5 / 4))\" is $?." # 0

(( 1 / 2 ))
echo "Exit status of \"(( 1 / 2 ))\" is $?."

(( 1 / 0 )) 2>/dev/null
echo "Exit status of \"(( 1 / 0 ))\" is $?."

echo "-------二.文件測試--------------------------------------"
# 如果沒有參數傳遞到腳本中，那麼就使用
# 當前目錄，否則就用傳遞進來的參數作爲目錄
# 來搜索
[ $# -eq 0 ] && directorys=`pwd` || directorys=$@

linkchk () {
	for element in $1/*; do
	[ -h "$element" -a ! -e "$element" ] && echo \"$element\"
	 [ -d "$element" ] && linkchk $element

	done
}

for directory in $directorys; do
	if [ -d $directory ]
	then linkchk $directory
	else
		echo "$directory is not a directory"
		echo "Usage: $0 dir1 dir2 ..."
	fi
done

echo "-------3.算術比較和字符串比較-------------------"
a=4;
b=5

echo

if [ "$a" -ne "$b" ]
then
	echo "$a is not equal to $b"
	echo "(arithmetic comparison)"
fi

echo

if [ "$a" != "$b" ]
then
	echo "$a is not equal to $b."
	echo "(string comparison)"
# "4" != "5"
# ASCII 52 != ASCII 53
fi

echo "---------------檢查字符串是否爲null-----------------------------"

if [ -n $string1 ]
then
	echo "String \"string1\" is not null."
else
	echo "String \"string1\" is null."
fi

if [ -n "$string1" ]
then 
	echo "String \"string1\" is not null."
else
	echo "String \"string1\" is null."
fi

if [ $string1 ]
then
	echo "String \"string\" is not null."
else
	echo "String \"string1\" is null."
fi

echo

string1=initialized
if [ $string1 ]
then
	echo "String \"string1\" is not null."
else
	echo "String \"string1\" is null."
fi

string1="a = b"
if [ $string1 ]
then
	echo "String \"string1\" is not null."
else
	echo "String \"string1\" is null."
fi

echo "-------------5.zmore----------------------------------"
NOARGS=65

NOTFOUND=66

NOTGZIP=67

if [ $# -eq 0 ]
then
	echo "Usage: `basename $0` filename">&2 
	exit $NOARGS
fi

filename=$1
if [ ! -f "$filename" ]
then
	echo "File $filename not found!" >&2
	exit $NOTFOUND
fi

if [ ${filename##*.} != "gz" ]
then
	echo "File $1 is not a gzipped file!"
	exit $NOTGZIP
fi

zcat $1 | more

exit $?














