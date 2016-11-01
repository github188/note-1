[
	{
		title:'货源投放分析' #接口名
		cmd:'supply.cmd?method=supplyanalysis'
		jsp:'supply/supplyAnalysis/base.jsp'
		url:'@imr@/pc/supply.cmd?method=getSupplyAnalysisData'
		param:{
			'monthId':'查询月份'
		}
		return:{ #字段对应列名
			PACK_BAR:'条形码'
			ITEM_NAME:'卷烟名称'
			COM_COUNT1:'在销地市个数'
			SCOUNT:'紧俏地市数'
			QTY_ORD:'商业销量（条）'
			QTY_NEED:'需求量'
			CO_COUNT_ORDFULL: '订满户次'
			CUST_COUNT_SUPPLY :'投放户数'
			CO_COUNT_ORD: '订购户次'
			CO_COUNT_NEED: '有需求户次'
			QTY_ORD1:'上一月份商业销量'
			QTY_NEED1:'上一月份需求量'
		}
	}
	{
		title:'在销地市覆盖情况' #接口名
		cmd:'supply.cmd?method=comsalinganalysis'#参数monthId;packBar；原样返回
		jsp:'supply/supplyAnalysis/comsaling.jsp'
		url:'@imr@/pc/supply.cmd?method=getComSalingAnalysisData'
		param:{
			'monthId':'查询月份'
			'packBar':'卷烟条码'
		}
		return:{ #字段对应列名
			CCOM_ID:'地市'
			COM_NAME:'地市名称'
			FLAG:'是否在销 1是0否'
			DEPT_COUNT_SALE:'覆盖县级单位数（个）'
			DEPT_COUNT_NORMAL :'正常销售区县个数'
			CUST_COUNT_ORD:'订购客户数（个）'
			CUST_COUNT_NORMAL:'正常经营零售客户数'
		}
	}
	{
		title:'投放规则明细' #接口名
		cmd:'supply.cmd?method=supplydetail' #参数date;packBar;返回date月份第一个周一
		jsp:'supply/supplyAnalysis/supplydetail.jsp'
		url:'@imr@/pc/supply.cmd?method=getRulesDetailData'
		param:{
			'date':'默认月份第一个周一'
			'packBar':'卷烟条码'
		}
		return:{ #字段对应列名
			CCOM_ID:'地市'
			COM_NAME:'地市名称'
			TACTIC_TYPE:'货源属性'
			QTY_IOW:'商业本周期初库存(条)'
			QTY_PURCH:'商业本周购进量(条)'
			SUPPLY_WAY:'投放方式' #10选点限量,20类别限量,30统一上限,40分配供应
			QTY_SUPPLY:'商业投放量 '
			CUST_COUNT_SUPPLY:'投放户数（个）'
			CUST_COUNT_NEED :'有需求户数'
			CUST_COUNT_ORD :'订购户数'
			QTY_NEED:'零售户需求量(条)'
			QTY_ORD:'零售户订购量(条)'
			CO_COUNT_ORDFULL:'订满户次'
			CUST_COUNT_SUPPLY:'投放户数'
			QTY_ORD_PERCENT_TOP1:'前1%订购量'
		}
	}
]