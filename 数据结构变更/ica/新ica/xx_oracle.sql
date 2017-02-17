CREATE TABLE ICA_PARMS_SCHEDULE(
	ICOM_ID VARCHAR(30) NOT NULL,
	COM_ID VARCHAR(30) NOT NULL,
	RCPT_DAY INTEGER NOT NULL,
	DIST_DAY INTEGER,
	ISS_DAY INTEGER,
	PERIOD_TYPE VARCHAR(2)
)TABLESPACE "TD_SALE";
ALTER TABLE  "ICA_PARMS_SCHEDULE" 
	ADD CONSTRAINT ICA_PARMS_SCHEDULE_PK PRIMARY KEY
		 ("ICOM_ID","COM_ID","RCPT_DAY") USING INDEX TABLESPACE "TD_OTHER_IDX";

CREATE TABLE ICA_PARMS(
	ICOM_ID VARCHAR(30) NOT NULL,
	COM_ID VARCHAR(30) NOT NULL,
	RCPT_FREQ VARCHAR(2),
	DIST_SEND_DAYS INTEGER,
	TRANSIT_DAYS INTEGER,
	AVERAGE_SALES_DAYS INTEGER,
	STATUS VARCHAR(2)
)TABLESPACE "TD_SALE";
ALTER TABLE "ICA_PARMS" 
	ADD CONSTRAINT ICA_PARMS_PK PRIMARY KEY
		 ("ICOM_ID","COM_ID") USING INDEX TABLESPACE "TD_OTHER_IDX";

ALTER TABLE ICA_AGREEMENT_ITEM ADD PACK_BAR VARCHAR(30) DEFAULT '' NOT NULL;
ALTER TABLE ICA_CONTRACT_ITEM ADD PACK_BAR VARCHAR(30) DEFAULT '' NOT NULL;
ALTER TABLE ICA_SUPPLY_PLAN_ITEM ADD PACK_BAR VARCHAR(30) DEFAULT '' NOT NULL;
ALTER TABLE ICA_ITEM_PARMS ADD PACK_BAR VARCHAR(30) DEFAULT '' NOT NULL;