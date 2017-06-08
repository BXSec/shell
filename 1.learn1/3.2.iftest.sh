#!/bin/bash
echo hell; echo there

filename=ttt.sh
if [ -r "$filename" ]; then  # "if" "the"需要分开，-r是判断文件是否存在
	echo "File $filename exists."; cp $filename #filename.bak
else
	echo "File #filename not found."; touch $filename
fi; echo "FIle test complete."
