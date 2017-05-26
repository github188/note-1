#!/bin/sh
# 由于版本发布产生了许多的无用的js文件，所以这里定时清理以下
FOLD_PATH=/opt/apache/htdocs/isrs/dist
maxTime="19900101000000"

deleteOldJs(){
	for file in ` ls $1 `
	do
		if [ -d $1"/"$file ]
			then deleteOldJs $1"/"$file
		else
			fileTrueName=`substr $file 1 `

}

maxMtimeFile(){
	for file in $@
	do
		if [ -f "$1/$file" ]
			then
				fileTime=`stat "$1/$file"|grep -i 最近更改|awk -F . '{print $1}'|awk -F ： '{print $2}'|awk -F - '{print $1$2$3}'|awk -F : '{print $1$2$3}'|awk '{print $1$2}'`
				if [ $fileTime -gt $maxTime ]
					then
						maxTime=$fileTime
						maxTimeFile=$file
				fi
		fi
	done
	return 0
}