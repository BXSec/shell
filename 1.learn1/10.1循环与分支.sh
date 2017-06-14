#!/bin/bash
echo "--------一. 循环--------------------------"
echo "=======1.for循环=========================="
echo
a=1
for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do
echo $a
echo $planet
((a=a+1))
done

echo

a=1
for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
do
echo $a
echo $planet
let "a=a+1"
done

echo "=====2. while循环===================="
var0=0
LIMIT=10
while [ "$var0" -lt "$LIMIT" ]
do
	echo -n "$var0"   # -n 将会阻止产生新行
#	var0=`expr $var0 + 1`
	var0=$((var0+1))
done

echo

echo "====3. until循环======================================"
END_CONDITION=end\

#until [ "$var1" = "$END_CONDITION" ]
#do
#	echo "Input variable #1"
#	echo "($END_CONDITION to exit)"
#	#read var1
#	echo "variable #1 = $var1"
#	echo
#done

#
echo "--------二. 嵌套循环---------------------"
echo "========1.嵌套循环================================="
outer=1
for a in 1 2 3 4 5 
do
	echo "Pass $outer in outer loop."
	echo "-------------------------------"
	inner=1
	for b in 1 2 3 4 5
	do
		echo "Pass $inner in inner loop."
		let "inner+=1"
	done

	let "outer+=1"
	echo
done

echo "=======三. 循环控制===================="
LIMIT=19
echo
echo "Printing Numbers 1 through 20 (but not 3 and 11)."
a=0
while [ "$a" -le "$LIMIT" ]
do
	a=$(($a+1))

	if [ "$a" -gt 2 ]
	then
#		break
		continue
	fi

	echo -n "$a"
done
echo;echo;echo;

#
echo "======四. 测试与分支============================================="
echo "-------case (in)/esac---------------------"
echo;echo "Hit a key, then hit return."
#read keypress
case "$keypress" in
[[:lower:]] ) echo "Lowercase letter";;
[[:upper:]] ) echo "Uppercase letter";;
[0-9]       ) echo "Digit";;
*           ) echo "Punctuation, whitespace, or other";;
esac

echo "-------select----------------------------------"
PS3='Choose your favorite vegetable: '
echo

select vegetable in "beans" "carrots" "potatoes" "onions" "rutabagas"
do
	echo
	echo "Your favorite veggie is $vegetable."
	echo "Yuck!"
	echo
	break
done





