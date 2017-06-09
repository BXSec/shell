#!/bin/bash

#a=123
#( a=321; )
#
#echo "$a"

# 数组
#arr=(1 4 5 7 9 21)
#echo ${arr[3]}

# 大括号{} 文件名扩展
#if [ ! -w 't.txt' ];
#then
#	touch t.txt
#fi
#echo 'test text' >> t.txt
#cp t.{txt,back}

# 大括号{} 代码块
#a=123
#{ a=321;}
#echo "a = $a"

# 中括号[] 1.条件测试
#a=5
#if [ $a -lt 10 ]
#then
#	echo "a: $a"
#else
#	echo 'a>10'
#fi

# 中括号[] 2.数组元素
#arr=(12 22 32)
#arr[0]=10
#echo ${arr[0]}

# 重定向
BACKUPFILE=backup-$(date +%m-%d-%Y)
#在备份文件中嵌入时间

archive=${1:-$BACKUPFILE}
# 如果在命令行中没有指定备份文件的文件名
# 那么将默认是用“backup-MM-DD-YYYY.tar.gz”。


tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "DIrectory $PWD backed up in archive file \"$archive.tar.gz\"."
exit 0
