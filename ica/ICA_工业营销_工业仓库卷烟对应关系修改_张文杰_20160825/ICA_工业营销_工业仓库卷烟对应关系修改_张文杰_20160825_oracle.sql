ALTER TABLE ICA_WHSE DROP COLUMN FACT_ID;

CREATE TABLE "ICA_WHSE_ITEM"  (
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "IS_DEFAULT" CHAR(1) , 
		  "ICOM_ID" VARCHAR(30) )TABLESPACE "TD_SALE";
ALTER TABLE  "ICA_WHSE_ITEM" 
	ADD PRIMARY KEY
		("WHSE_ID","ITEM_ID") USING INDEX TABLESPACE "TD_OTHER_IDX";