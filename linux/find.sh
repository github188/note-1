#当前文件夹查找文件类型为java的所有文件
find . -name '*.java' -type f

#当前文件夹查找文件类型为java的并且文本中包含TestCmd单词
find . -name '*.java' -type f -exec grep Testcmd {} \;

#查找当前文件夹中过去一天之内修改过的java和jsp
find -regex '.*\.\(jsp\|java\)' -ctime -1