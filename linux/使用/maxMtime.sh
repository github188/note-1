#!/bin/sh
# 取目录下最新的文件,可用于比较版本 find !-newer `maxMtimeFile`
maxTime="19900101000000"
maxMtimeFile(){
	for file in ` ls $1 `
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
maxMtimeFile `pwd`
echo $maxTimeFile
echo $maxTime