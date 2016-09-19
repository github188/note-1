ALTER TABLE ICA_CO_LINE ADD COLUMN QTY_ARE  DECIMAL(18,6) WITH DEFAULT 0 ;
CALL SYSPROC.ADMIN_CMD('REORG TABLE ICA_CO_LINE');

ALTER TABLE ICA_CO ADD COLUMN QTY_ARE  DECIMAL(18,6) WITH DEFAULT 0 ;
CALL SYSPROC.ADMIN_CMD('REORG TABLE ICA_CO');

ALTER TABLE ICA_CO_ALLOT DROP COLUMN FACT_ID;
ALTER TABLE ICA_CO_ALLOT ADD COLUMN WHSE_ID VARCHAR(30) WITH DEFAULT ' ';
ALTER TABLE ICA_CO_ALLOT ALTER COLUMN WHSE_ID SET NOT NULL ;
CALL SYSPROC.ADMIN_CMD('REORG TABLE ICA_CO_ALLOT');
ALTER TABLE ICA_CO_ALLOT ADD CONSTRAINT ICA_CO_ALLOT_PK PRIMARY KEY(WHSE_ID,CO_ID);

ALTER TABLE ICA_CO_ALLOT_LINE DROP COLUMN FACT_ID;
ALTER TABLE ICA_CO_ALLOT_LINE ADD COLUMN WHSE_ID VARCHAR(30) WITH DEFAULT ' ';
ALTER TABLE ICA_CO_ALLOT_LINE ALTER COLUMN WHSE_ID SET NOT NULL ;
CALL SYSPROC.ADMIN_CMD('REORG TABLE ICA_CO_ALLOT_LINE');
ALTER TABLE ICA_CO_ALLOT_LINE ADD CONSTRAINT ICA_CO_ALLOT_LINE_PK PRIMARY KEY(WHSE_ID,CO_ID,ITEM_ID);

CREATE TABLE ICA_COM_ITEM_MONTH(
	DATE1 CHAR(6) NOT NULL,
	ICOM_ID VARCHAR(30) NOT NULL,
	COM_ID VARCHAR(30) NOT NULL,
	ITEM_ID VARCHAR(30) NOT NULL,
	GRADE_ID VARCHAR(30) NOT NULL,
	SALE_CENTER_ID  VARCHAR(30) ,
	SALEORG_ID  VARCHAR(30) ,
	AREA_ID  VARCHAR(30) ,
	SLSMAN_ID  VARCHAR(30) ,
	QTY_SOLD DECIMAL(18,2)
) IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ;
ALTER TABLE  "ICA_COM_ITEM_MONTH" 
	ADD CONSTRAINT ICA_COM_ITEM_MONTH_PK PRIMARY KEY 
		("DATE1","ICOM_ID","COM_ID","ITEM_ID","GRADE_ID");