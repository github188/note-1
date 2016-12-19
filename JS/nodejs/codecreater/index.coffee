#BASE_DIR：工作区间的绝对路径
#APP：应用的名
#MODULE:模块名
#FUNCTION:新增加功能名
#usage coffee #{thisscript} 'imr' 'pc' 'cust/valueIndex'
_defOptions = BASE_DIR:'/home/zhangwj/workspace/'

JavaCreater = require 'java'
ConfCreater = require 'conf'
JspCreater = require 'jsp'

_init = ()->
	args = process.argv
	_defOptions.APP = args[2]
	_defOptions.MODULE = args[3]
	_defOptions.FUNCTION = args[4]
	JavaCreater.init _defOptions
	ConfCreater.init _defOptions
	JspCreater.init _defOptions

#生成代码
_init()