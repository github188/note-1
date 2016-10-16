fs = require('fs');
items = [
	{
		ITEM_ID:'3452131234'
		PACK_BAR:'312424123123'
	}
	{
		ITEM_ID:'6901028149242'
		PACK_BAR:'6901028149242'
	}
	{
		ITEM_ID:'6901028149365'
		PACK_BAR:'6901028149365'
	}
	{
		ITEM_ID:'6901028149921'
		PACK_BAR:'6901028149921'
	}
]
coms = [
	{
		COM_ID:'000000000000138'
		CCOM_ID:'000000000000138'
		PCOM_ID:'000000000000138'
	}
	{
		COM_ID:'11210201C'
		CCOM_ID:'11210201C'
		PCOM_ID:'11210201P'
	}
	{
		COM_ID:'11370101'
		CCOM_ID:'11370101'
		PCOM_ID:'11370001'
	}
	{
		COM_ID:'11370701'
		CCOM_ID:'11370701'
		PCOM_ID:'11370001'
	}
	{
		COM_ID:'11610101'
		CCOM_ID:'11610101'
		PCOM_ID:'11610001'
	}
]
dates = [ '201511', '201512' ,'201601' ,'201602' ,'201603' ,'201604' ,'201605' ,'201606', '201607', '201608']
rlt = ''
for date in dates
	for com in coms
		for item in items
			rlt += ( """
				INSERT INTO SCMR_SGP_ITEM_MONTH
				(PCOM_ID, CCOM_ID, COM_ID, PACK_BAR, T_SIZE, ITEM_ID, MONTH1, YEAR1, BEGIN_DAY, END_DAY, SUPPLY_WAY, TACTIC_TYPE, CUST_COUNT_PLAN, QTY_IOM, QTY_PURCH, QTY_SUPPLY, CUST_COUNT_SUPPLY, QTY_NEED, CO_COUNT_NEED, CUST_COUNT_NEED, QTY_ORD, AMT_ORD, CO_COUNT_ORD, CUST_COUNT_ORD, CO_COUNT_ORDFULL, DAY_COUNT_MONTH, DAY_COUNT_OUT_STOCK, QTY_ORD_PERCENT_TOP1, QTY_ORD_TOP50, UPDATE_TIME)
				VALUES('#{com.PCOM_ID}', '#{com.CCOM_ID}', '#{com.COM_ID}', '#{item.PACK_BAR}', 200, '#{item.ITEM_ID}', '#{date}', '#{date.substring(0,4)}', '#{date}01', '#{date}30', '30', '31', 
				#{parseInt(Math.random()*100)}, #{parseInt(Math.random()*10000)}, #{parseInt(Math.random()*10000)}, #{parseInt(Math.random()*1000)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*3000)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, TO_DATE('2016-09-23 09:55:46','YYYY-MM-DD HH24:MI:SS'));
			""")

resultBuffer = new Buffer(rlt)
fs.writeFile('./sgpItemMonth.sql',resultBuffer,(err)->
		if err
			throw err
		console.log('has finished')
	)