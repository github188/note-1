CREATE TABLE "SCMR_RECEIVE_BRDOWNER_LOG"  (
		  "LOG_ID" VARCHAR(30) NOT NULL , 
		  "TABLE_NAME" VARCHAR(100) , 
		  "RECEIVE_DATE" VARCHAR(8) , 
		  "DATA_DATE_START" VARCHAR(20) , 
		  "DATA_DATE_END" VARCHAR(20) , 
		  "START_TIME" VARCHAR(20) , 
		  "END_TIME" VARCHAR(20) , 
		  "DATA_NUM" INTEGER , 
		  "IS_SUCCESS" CHAR(1) , 
		  "IS_EXCEPTION" CHAR(1) , 
		  "TRANS_TYPE" CHAR(1) , 
		  "NOTE" VARCHAR(3500) , 
		  "BRDOWNER_ID" VARCHAR(30) )   
		 IN "TD_BASE" INDEX IN "TD_BASE_IDX" ;
ALTER TABLE "SCMR_RECEIVE_BRDOWNER_LOG" 
	ADD CONSTRAINT "SCMR_RECEIVE_BRDOWNER_LOG_PK" PRIMARY KEY
		("LOG_ID");