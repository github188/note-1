[
	{
		title:'货源投放分析' #接口名
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
		url:'@imr@/pc/supply.cmd?method=getComSalingAnalysisData'
		param:{
			'monthId':'查询月份'
			'packBar':'卷烟条码'
		}
		return:{ #字段对应列名
			CCOM_ID:'地市'
			FLAG:'是否在销 1是0否'
			DEPT_COUNT_SALE:'覆盖县级单位数（个）'
			DEPT_COUNT_NORMAL :'正常销售区县个数'
			CUST_COUNT_ORD:'订购客户数（个）'
			CUST_COUNT_NORMAL:'正常经营零售客户数'
		}
	}
]