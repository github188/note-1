--CUST_COUNT_SUPPLY/CUST_COUNT_NEED NEEDRATE,--投放面(这个需要注意)
--CUST_COUNT_NEED-CUST_COUNT_ORD NEED_ORD,--断供零售户数(个)(这个需要注意)
--(CO_COUNT_NEED-CO_COUNT_ORD)/CO_COUNT_NEED ORDRATE,--断供面
--CO_COUNT_ORDFULL/CUST_COUNT_SUPPLY FULLRATE, --订足面
--QTY_ORD/QTY_NEED ORDNEEDRATE, --订单满足率(%)
--QTY_ORD_PERCENT_TOP1*100/QTY_ORD QTYRATE --投放集中度(%)
--订足率=订购量*100.00/投放量

SELECT 
	PACK_BAR,
	TACTIC_TYPE,--货源属性
	QTY_IOW,--商业本周期初库存(条)
	QTY_PURCH, --商业本周购进量(条)
	SUPPLY_WAY, --投放方式
	QTY_SUPPLY,--商业投放量 
	CUST_COUNT_SUPPLY, --投放户数（个）
	CUST_COUNT_NEED ,--有需求户数
	CUST_COUNT_ORD ,--订购户数
	QTY_NEED,--零售户需求量(条)
	QTY_ORD,--零售户订购量(条)
	CO_COUNT_ORDFULL,--订满户次
	CUST_COUNT_SUPPLY  --投放户数
FROM 
	SCMR_SGP_ITEM_WEEK 
WHERE 
	PACK_BAR IN ('') 
	AND BEGIN_DAY>='20160801'
	AND END_DAY<='20160831'
;

