CREATE TABLE ICM_ONLINE_INVEST(
	ONLINE_ID VARCHAR(30) NOT NULL,
	ICOM_ID VARCHAR(30) ,
	SCOPE VARCHAR(200) ,
	BEGIN_DATE CHAR(8) ,
	END_DATE CHAR(8) ,
	DEAL_DATE CHAR(8) ,
	PURPOSE VARCHAR(400) ,
	RESPONDENT VARCHAR(200) ,
	INV_RESOURCE VARCHAR(200) ,
	NOTE VARCHAR(400) ,
	SCHEDULE VARCHAR(1000) ,
	STATUS CHAR(2) ,
	TASK_ID VARCHAR(30))TABLESPACE "TD_SALE";
ALTER TABLE  "ICM_ONLINE_INVEST" 
	ADD CONSTRAINT ICM_ONLINE_INVEST_PK PRIMARY KEY
		("ONLINE_ID") USING INDEX TABLESPACE "TD_OTHER_IDX";

ALTER TABLE ICM_STORAGE_APPEND ADD ATTACH_DESC VARCHAR(200);

ALTER TABLE ICM_STORAGE_APPEND MODIFY (RES_ID VARCHAR(32));