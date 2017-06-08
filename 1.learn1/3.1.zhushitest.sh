#!/bin/bash

echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # 这里开始一个注释
echo $(( 2#101011 ))  # 数制转换（使用二进制表示）,不是一个注释，双括号表示对于数字的处理



