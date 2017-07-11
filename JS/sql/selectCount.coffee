fs = require('fs');

tables = [
		{name:'SCMR_SGP_ORG_CUSTTYPE_ITEM_SW',dateCol:'DATE1'},
		{name:'SCMR_PI_COM_DAY',dateCol:'DATE1'},
		{name:'SCMR_SGP_COM_CUSTTYPE_ITEM_SW',dateCol:'DATE1'},
		{name:'SCMR_PI_COM_ITEM_DAY',dateCol:'DATE1'},
		{name:'SCMR_PI_INVTY_DAY',dateCol:'DATE1'},
		{name:'SCMR_SGP_ORG_ITEM_SW',dateCol:'DATE1'},
		{name:'SCMR_SCM_ITEM_FORE',dateCol:'DATE1'},
		{name:'SCMR_SGP_COM_ITEM_SW',dateCol:'DATE1'},
		{name:'SCMR_SGP_ITEM_SPW_EXT',dateCol:'WEEK'},
		{name:'SCMR_PI_ITEM_STOCK_MONTH',dateCol:'DATE1'},
		{name:'SCMR_PI_ITEM_ORD_MONTH',dateCol:'DATE1'},
		{name:'SCMR_SGP_ITEM_MONTH',dateCol:'MONTH1'},
		{name:'SCMR_SCM_MIC_ITEM_MARKET_STAT',dateCol:'PRI_WEEK'},
		{name:'SCMR_PI_CUSTTYPE_MONTH',dateCol:'DATE1'}
	]

rlt = ''
for table in tables
	rlt += """

		SELECT
			COUNT(1) DATA_RECEIVE_COUNT,
			'#{table.name}' TABLE_NAME,
			A.PCOM_ID
		FROM
			#{table.name} A,
			SCMR_RECEIVE_LOG B
		WHERE
			A.#{table.dateCol} BETWEEN B.DATA_DATE_START AND B.DATA_DATE_END
			AND A.PCOM_ID=B.PCOM_ID
			AND B.TABLE_NAME='#{table.name}'
			AND B.RECEIVE_DATE='${value}'
		GROUP BY
			A.PCOM_ID
		
		UNION ALL

	"""
resultBuffer = new Buffer(rlt)
fs.writeFile('./selectCount.sql',resultBuffer,(err)->
		if err
			throw err
		console.log('has finished')
	)