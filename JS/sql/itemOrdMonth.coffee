
# INSERT INTO DB2INST1.SCMR_PI_ITEM_ORD_MONTH
# (PCOM_ID, CCOM_ID, COM_ID, PACK_BAR, T_SIZE, ITEM_ID, DATE1, CUST_COUNT_NORMAL, CUST_COUNT_NEED, CO_COUNT_NEED, QTY_NEED, CUST_COUNT_ORD, CO_COUNT_ORD, QTY_ORD, AMT_ORD, CUST_COUNT_NEED_MANY, QTY_NEED_NEED_MANY, QTY_ORD_NEED_MANY, AMT_ORD_NEED_MANY, CUST_COUNT_ORD_MANY, QTY_NEED_ORD_MANY, QTY_ORD_ORD_MANY, AMT_ORD_ORD_MANY, CUST_COUNT_ORD_EVERY, QTY_NEED_ORD_EVERY, QTY_ORD_ORD_EVERY, AMT_ORD_ORD_EVERY, UPDATE_TIME)
# VALUES('000000000004294', '000000000000138', '630000000', '6901028149242', 200, '31010101', '201609', 14, 5, 34, 34.00, 34, 12, 99.00, 345245.00, 0, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, 0, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*10)0}, #{parseInt(Math.random()*100)}, 0, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, TO_DATE('2016-09-23 09:55:47','YYYY-MM-DD HH24:MI:SS'));
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
				INSERT INTO SCMR_PI_ITEM_ORD_MONTH
				(PCOM_ID, CCOM_ID, COM_ID, PACK_BAR, T_SIZE, ITEM_ID, DATE1, CUST_COUNT_NORMAL, CUST_COUNT_NEED, CO_COUNT_NEED, QTY_NEED, CUST_COUNT_ORD, CO_COUNT_ORD, QTY_ORD, AMT_ORD, CUST_COUNT_NEED_MANY, QTY_NEED_NEED_MANY, QTY_ORD_NEED_MANY, AMT_ORD_NEED_MANY, CUST_COUNT_ORD_MANY, QTY_NEED_ORD_MANY, QTY_ORD_ORD_MANY, AMT_ORD_ORD_MANY, CUST_COUNT_ORD_EVERY, QTY_NEED_ORD_EVERY, QTY_ORD_ORD_EVERY, AMT_ORD_ORD_EVERY, UPDATE_TIME)
				VALUES('#{com.PCOM_ID}', '#{com.CCOM_ID}', '#{com.COM_ID}', '#{item.PACK_BAR}', 200, '#{item.ITEM_ID}', '#{date}', #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*10000)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, 0, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, #{parseInt(Math.random()*100)}, TO_DATE('2016-09-23 09:55:47','YYYY-MM-DD HH24:MI:SS'));
			""")

resultBuffer = new Buffer(rlt)
fs.writeFile('./resut.sql',resultBuffer,(err)->
		if err
			throw err
		console.log('has finished')
	)