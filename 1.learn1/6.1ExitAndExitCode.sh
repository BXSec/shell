#!/bin/bash

# 退出狀態碼
echo hello
echo $?

#lskdf
#echo $?

echo 

#exit 113

# 反轉一個條件的用法
true
echo "exit status of \"true\" = $?"  # 0

! true
echo "exit status of \"! true\" = $?" # 1

true

! true



