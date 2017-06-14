#!/bin/bash

var=27
category=minerals # 在"="之后是不允许出现空白字符的

if [ "$string1" = "$string2" ]
	# if [ "X$string1" = "X$string2" ] 是一种安全的做法
	# 这样可以防止两个变量中的一个为空所产生的错误
	# (字符"X"作为前缀在等式两边是可以互相抵消的.)
then
	echo 
fi

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
 echo "Usage: `basename $0` first-number second-number"
 exit $E_BADARGS

gcd ()
{
 dividend=$1
 divisor=$2

 remainder=1

until [ "$remainder" -eq 0 ]
do
	let "remainder = $dividend % $divisor"
	dividend=$divisor
	divisor=$remainder
done
}

gcd $1 $2

echo
echo "GCD of $1 and $2 = $dividend" 
echo
