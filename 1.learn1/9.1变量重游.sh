#!/bin/bash

#echo $BASH

#xyz23()
#{
#	echo "$FUNCNAME now executing."
#}

#xyz23
#echo "FUNCNAME = $FUNCNAME"

# IFS
output_args_one_per_line()
{
	for arg
	do echo "[$arg]"
	done
}
echo; echo "IFS=\" \""
echo "--------------"

IFS=" "
var=" a  b c    "
output_args_one_per_line $var

echo; echo "IFS=:"
echo "-------"
IFS=:
var=":a::b:c:::"
output_args_one_per_line $var

echo "-------------\$REPLY---------------------"
echo
echo -n "What is your favorite vegetable? "
#read

echo "Your favorite vegetable is $REPLY."
# 当且仅当没有变量提供给"read"命令时，
# REPLY才保存最后一个"read"命令读入的值
echo
echo -n "What is your favorite fruit? "
#read fruit
echo "Your favorite fruit is $fruit."
echo "but..."
echo "Value of \$REPLY is still $REPLY."

echo "------------\$*和\$@------------------"
# $* 所有的位置参数都被看作一个单词
# $@ 与 $*相同，但是每个参数都是一个独立的引用字符串
E_BADARGS=65
if [ ! -n "$1" ]
then
 echo "Usage: `basename $0` argument1 argument2 etc."
 fi

 echo

 index=1

echo "Listing args with \"\$*\":"
for arg in "$*"
do
echo "Arg #$index = $arg"
let "index+=1"
done

echo "Entire arg list seen as single word."

echo

index=1

echo "Listing args with \"\$@\":"
for arg in "$@"
do
echo "Arg #$index = $arg"
let "index+=1"
done
echo "Arg list seen as separate words."

echo

index=1

echo "Listing args with \$* (unquoted):"
for arg in $*
do
echo "Arg #$index = $arg"
let "index+=1"
done
echo "Arg list seen as separate words."

echo "======操作字符串========================"
echo "----------字符串长度-----------------"
stringZ=abcABC123ABCabc
echo ${#stringZ}
expr length $stringZ

echo "-----------------使用awk来处理字符串-----------------------"
string=23shidoo1

# Bash 的第一个字符串是从'0'开始记录的
# Awk 的第一个字符是从 '1' 开始记录的
echo ${string:2:4} # 位置3 (0-1-2)，4个字符长

# awk中等价于${string:pos:length}的命令是substr(string,pos,length).
echo | awk '
{
	print substr("'"${string}"'",3,4)  # skid
}
'
echo "=======参数替换================================="
your_id=${USER}-on-${HOSTNAME}
echo "$your_id"
echo "Old \$PATH = $PATH"
PATH=${PATH}:/opt/bin
echo "New \$PATH = $PATH"

username0=
echo "username0 has been declared, but is set to null."
echo "username0 = ${username0-'whoami'}"
# 将会输出默认值

username2=
echo "username2 has been declared, but is set to null."
echo "username2 = ${username2:-'whoami'}"

: ${HOSTNAME?} ${USER?} ${MAIL?}
echo
echo "Name of the machine is $HOSTNAME."
echo "You are $USER."
echo "Your home directory is $HOME."
echo "Your mail INBOX is located is $MAIL."
echo
echo "If you are reading this message,"
echo "critical environmental variables have been set."
echo
echo

ThisVariable=Value-of-ThisVariable
: ${ThisVariable?}
echo "Value of ThisVariable is $ThisVariable."
echo
echo

#: ${ZZXy23AB?"ZZXy23AB has not been set."}

echo "You will not see this message, because script already terminated."

# HERE=0

echo "============变量长度/子串删除======================"
E_NO_ARGS=65

if [ $# -eq 0 ]
then
echo "Please invoke this script with one or more command-line arguments."
exit E_NO_ARGS
fi

var01=abcdEFGH28ij
echo "var01 = ${var01}"
echo "Length of var01 = ${#var01}"
# 现在，在变量中嵌入一个空格
var02="abcd EFGH28ij"
echo "var02 = ${var02}"
echo "Length of var02 = ${#var02}"

echo "Number of command-line arguments passed to script = ${#@}"
echo "Number of command-line arguments passed to script = ${#*}"
echo "${@}"
echo "$0 $1"


strip_leading_zero2()
{
	shopt -s extglob # 打开扩展的通配(globbing).
	local val=${1##+(0)} # 使用局部变量，匹配最长连续的一个或多个0.
	shopt -u extglob
	_strip_leading_zero2=${val:-0}

}

strip_leading_zero2 $@

echo "===============变量扩展/子串替换======================="
echo "---------# ## % %%匹配-------------"
var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo "var1 (with everything, up to and incuding first - stripped out) = $t"

t=${var1##*-*}
echo "If var1 contains a \"-\", returns empty string... var1 = $t"

t=${var1%*-*}
echo "var1 (with everything from the last - on stripped out) = $t"
echo "-----# ## % %%匹配替换-------------------"
v0=abc1234zip1234abc
echo "v0 = $v0"
echo

v1=${v0/#abc/ABCDEF}

echo "v1 = $v1"

v2=${v0/%abc/ABCDEF}

echo "v2 = $v2"
echo

v3=${v0/#123/000} # 必须匹配字符串的开头语结尾，否则不生效
echo "v3 = $v3"
v4=${v0/%123/000}
echo "v4 = $v4"

echo "=======四. 指定变量的类型：使用declare或typeset==========="
func1 ()
{
	echo This is a function.
}
declare -f   # 列出前面定义的所有函数
echo

declare -i var1   # var1是个整型变量
var1=2367
echo "var1 declared as $var1"
var1=var1+1
echo "var1 incremented by 1 is $var1."
# 尝试修改一个已经声明为整型变量的值.
echo "Attempting to change var1 to floating point value, 2367.1."
var1=2367.1
echo "var1 is still $var1"
echo

declare -r var2=13.36 # 'declare'允许设置变量de属性, 同时给变量赋值
echo "var2 declared as $var2"
var2=13.37          # 产生错误消息，并且从脚本退出
echo "var2 is still $var2"

echo "=======五. 变量的间接引用==========================="
a=letter_of_alphabet
letter_of_alphabet=z
echo

echo "a = $a"

# 间接引用
eval a=$\$$a
echo "Now a =　$a" # 现在 a = z

echo

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "Changing value of \"table_cell_3\" to $NEW_VAL."
echo "\"table_cell_3\" now $table_cell_3"
echo -n "dereferenced \"t\" now "; eval echo \$$t

echo


echo "=========六. 双圆括号结构==================="
echo 

(( a = 23 ))
echo "a (initial value) = $a"

((a++))
echo "a (after a++) = $a"
((a--))
echo "a (after a--) = $a"

((++a))
echo "++a = $a"
((--a))
echo "--a = $a"

echo

n=1; let --n && echo "True" || echo "False"
n=1; let n-- && echo "True" || echo "False"
echo

((t = a<45?7:11))
echo "If a < 45, then t = 7, 
else t = 11."
echo "t = $t"
echo













