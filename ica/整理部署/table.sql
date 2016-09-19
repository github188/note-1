

------------------------------------------------
-- DDL Statements for Table "ICA_TAX"
------------------------------------------------
 

CREATE TABLE "ICA_TAX"  (
		  "TAX_ID" VARCHAR(30) NOT NULL , 
		  "TAX_RATE" DECIMAL(18,6) NOT NULL , 
		  "TAX_NAME" VARCHAR(15) , 
		  "IS_USE" CHAR(1) NOT NULL WITH DEFAULT '1' , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_TAX"

ALTER TABLE "ICA_TAX" 
	ADD CONSTRAINT "ICA_TAX_PK" PRIMARY KEY
		("TAX_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_FACT_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_FACT_ITEM"  (
		  "FACT_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" DECIMAL(30,0) NOT NULL , 
		  "IS_DEFAULT" CHAR(1) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_FACT_ITEM"

ALTER TABLE "ICA_FACT_ITEM" 
	ADD PRIMARY KEY
		("FACT_ID",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_ITEM"  (
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_NAME" VARCHAR(50) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "STANDARD_CODE" VARCHAR(30) , 
		  "PACK_BAR" VARCHAR(30) NOT NULL , 
		  "BOX_BAR" VARCHAR(30) , 
		  "BIGBOX_BAR" VARCHAR(30) , 
		  "BRAND_ID" VARCHAR(30) , 
		  "UM_ID" CHAR(2) WITH DEFAULT '01' , 
		  "UM_WHSE" CHAR(2) WITH DEFAULT '01' , 
		  "UM_SALE" CHAR(2) WITH DEFAULT '01' , 
		  "UM_INVOICE" CHAR(2) WITH DEFAULT '01' , 
		  "H_SIZE" DECIMAL(20,2) WITH DEFAULT 20 , 
		  "T_SIZE" DECIMAL(20,2) WITH DEFAULT 200 , 
		  "J_SIZE" DECIMAL(20,2) WITH DEFAULT 10000 , 
		  "W_SIZE" DECIMAL(20,2) WITH DEFAULT 10000 , 
		  "X_SIZE" DECIMAL(20,2) WITH DEFAULT 50000 , 
		  "PRICE_PUH_TAX" DECIMAL(18,6) , 
		  "PRICE_PUH_NO_TAX" DECIMAL(18,6) , 
		  "SPEC" VARCHAR(20) , 
		  "KIND" CHAR(1) , 
		  "PACK_KIND" CHAR(1) , 
		  "PRODUCT_TYPE" CHAR(2) , 
		  "TAX_ID" VARCHAR(30) , 
		  "TAR_CONT" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "GAS_NICOTINE" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "CO_CONT" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "BRD_KIND" CHAR(1) WITH DEFAULT '0' , 
		  "BRD_KEY" CHAR(1) WITH DEFAULT '0' , 
		  "IS_HUNDREDBRAND" CHAR(1) WITH DEFAULT '1' , 
		  "IS_LOWEND" CHAR(1) WITH DEFAULT '1' , 
		  "IS_RARE" CHAR(1) WITH DEFAULT '0' , 
		  "IS_MATURE" CHAR(1) WITH DEFAULT '0' , 
		  "IS_THIN" CHAR(1) , 
		  "IS_TALL" CHAR(1) , 
		  "IS_POOL" CHAR(1) NOT NULL WITH DEFAULT '0' , 
		  "SEQ_CODE" INTEGER , 
		  "IS_USE" CHAR(1) NOT NULL WITH DEFAULT '1' , 
		  "IS_WARNING" CHAR(1) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 

COMMENT ON COLUMN "ICA_ITEM"."ITEM_NAME" IS '¾íÑÌÃû³Æ';


-- DDL Statements for Primary Key on Table "ICA_ITEM"

ALTER TABLE "ICA_ITEM" 
	ADD CONSTRAINT "ICA_ITEM_PK" PRIMARY KEY
		("ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_WHSE"
------------------------------------------------
 

CREATE TABLE "ICA_COM_WHSE"  (
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "WHSE_NAME" VARCHAR(100) NOT NULL , 
		  "WHSE_ADDR" VARCHAR(100) NOT NULL , 
		  "IS_DEFAULT" CHAR(1) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_COM_WHSE"

ALTER TABLE "ICA_COM_WHSE" 
	ADD CONSTRAINT "ICA_COM_WHSE_PK" PRIMARY KEY
		("WHSE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_TRANS_TYPE"
------------------------------------------------
 

CREATE TABLE "ICA_TRANS_TYPE"  (
		  "TYPE_ID" VARCHAR(10) NOT NULL , 
		  "TRAN_TYPE" VARCHAR(30) , 
		  "TRAN_WAY" CHAR(2) , 
		  "CAPACITY" DECIMAL(18,2) WITH DEFAULT 0.00 , 
		  "OWN_TYPE" CHAR(1) , 
		  "IS_USE" CHAR(1) , 
		  "NOTE" VARCHAR(200) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_TRANS_TYPE"

ALTER TABLE "ICA_TRANS_TYPE" 
	ADD CONSTRAINT "ICA_TRANS_TYPE_PK" PRIMARY KEY
		("TYPE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_AGREEMENT"
------------------------------------------------
 

CREATE TABLE "ICA_AGREEMENT"  (
		  "AGREE_NUM" VARCHAR(30) NOT NULL , 
		  "STAND_NUM" VARCHAR(30) , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "SUP_ID" VARCHAR(30) NOT NULL , 
		  "REQ_ID" VARCHAR(30) NOT NULL , 
		  "SUP_DEP" VARCHAR(10) NOT NULL , 
		  "REQ_DEP" VARCHAR(10) NOT NULL , 
		  "DATE_TYPE" CHAR(3) NOT NULL , 
		  "AGREE_DATE" CHAR(6) NOT NULL , 
		  "AGREE_TYPE" CHAR(2) NOT NULL , 
		  "DELI_DATE_BEGIN" VARCHAR(8) , 
		  "DELI_DATE_END" VARCHAR(8) , 
		  "IS_SIGNED" CHAR(1) , 
		  "SIGN_DATE" VARCHAR(8) , 
		  "SIGNER" VARCHAR(30) , 
		  "CANCEL_DATE" VARCHAR(8) , 
		  "CRT_DATE" CHAR(8) , 
		  "CRT_USER_ID" VARCHAR(30) , 
		  "CONFIRM_DATE" CHAR(8) , 
		  "IS_IMPORTED" CHAR(1) , 
		  "STATUS" CHAR(1) , 
		  "NOTE" VARCHAR(50) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_AGREEMENT"

ALTER TABLE "ICA_AGREEMENT" 
	ADD CONSTRAINT "ICA_AGREEMENT_PK" PRIMARY KEY
		("AGREE_NUM");



------------------------------------------------
-- DDL Statements for Table "ICA_MONTH_REQ"
------------------------------------------------
 

CREATE TABLE "ICA_MONTH_REQ"  (
		  "REQ_ID" VARCHAR(20) NOT NULL , 
		  "REQ_MONTH" CHAR(6) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "STATUS" CHAR(1) NOT NULL WITH DEFAULT '0' , 
		  "CRT_ORGAN_ID" VARCHAR(30) , 
		  "CRT_DATE" VARCHAR(12) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_MONTH_REQ"

ALTER TABLE "ICA_MONTH_REQ" 
	ADD CONSTRAINT "ICA_MONTH_REQ_PK" PRIMARY KEY
		("REQ_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_DIST_CALC"
------------------------------------------------
 

CREATE TABLE "ICA_DIST_CALC"  (
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "PRI_WEEK" CHAR(7) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "CALC_FLAG" CHAR(2) NOT NULL , 
		  "FAIL_CODE" CHAR(2) , 
		  "UM_ID" CHAR(2) NOT NULL WITH DEFAULT '0' , 
		  "BASE_STORE_DATE" VARCHAR(8) , 
		  "SEASON_PARM" DECIMAL(18,6) WITH DEFAULT 1 , 
		  "CALC_DATE" VARCHAR(8) NOT NULL , 
		  "CALC_USER_ID" VARCHAR(30) , 
		  "CALC_USER_NAME" VARCHAR(20) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_DIST_CALC"

ALTER TABLE "ICA_DIST_CALC" 
	ADD CONSTRAINT "ICA_DIST_CALC_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID",
		 "PRI_WEEK");



------------------------------------------------
-- DDL Statements for Table "ICA_DIST_CALC_LOG"
------------------------------------------------
 

CREATE TABLE "ICA_DIST_CALC_LOG"  (
		  "LOG_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "PRI_WEEK" CHAR(7) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "CALC_FLAG" CHAR(2) NOT NULL , 
		  "FAIL_CODE" CHAR(2) , 
		  "UM_ID" CHAR(2) NOT NULL WITH DEFAULT '0' , 
		  "BASE_STORE_DATE" VARCHAR(8) , 
		  "SEASON_PARM" DECIMAL(18,6) WITH DEFAULT 1 , 
		  "CALC_DATE" VARCHAR(8) NOT NULL , 
		  "CALC_USER_ID" VARCHAR(30) , 
		  "CALC_USER_NAME" VARCHAR(20) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_DIST_CALC_LOG"

ALTER TABLE "ICA_DIST_CALC_LOG" 
	ADD CONSTRAINT "ICA_DIST_CALC_LOG_PK" PRIMARY KEY
		("LOG_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_DIST_PLAN"
------------------------------------------------
 

CREATE TABLE "ICA_DIST_PLAN"  (
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "PRI_WEEK" VARCHAR(8) NOT NULL , 
		  "PLAN_TYPE" CHAR(2) NOT NULL , 
		  "STATUS" CHAR(2) NOT NULL , 
		  "UM_ID" CHAR(2) NOT NULL WITH DEFAULT '0' , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "AGREE_NUM" VARCHAR(30) , 
		  "BASE_STORE_DATE" VARCHAR(8) , 
		  "CC_WHSE_ID" VARCHAR(30) , 
		  "RC_WHSE_ID" VARCHAR(30) , 
		  "CRT_USER_ID" VARCHAR(30) , 
		  "CRT_USER_NAME" VARCHAR(30) , 
		  "CRT_DATE" CHAR(8) , 
		  "SHARE_DATE" VARCHAR(8) , 
		  "SHARE_USER_ID" VARCHAR(30) , 
		  "SHARE_USER_NAME" VARCHAR(20) , 
		  "CFM_OPINION" VARCHAR(100) , 
		  "CFM_DATE" VARCHAR(8) , 
		  "CFM_USER_ID" VARCHAR(30) , 
		  "CFM_USER_NAME" VARCHAR(20) , 
		  "ISS_OPINION" VARCHAR(100) , 
		  "SUBMIT_DATE" CHAR(8) , 
		  "SUBMIT_USER_ID" VARCHAR(30) , 
		  "SUBMIT_USER_NAME" VARCHAR(20) , 
		  "FEEDBACK_OPINION" VARCHAR(100) , 
		  "APPROVE_DATE" VARCHAR(8) , 
		  "APPROVE_USER_ID" VARCHAR(30) , 
		  "APPROVE_USER_NAME" VARCHAR(20) , 
		  "EXEC_TYPE" CHAR(1) WITH DEFAULT '1' , 
		  "APPROVE_TIME" CHAR(8) , 
		  "SUBMIT_TIME" CHAR(8) , 
		  "CFM_TIME" CHAR(8) , 
		  "SHARE_TIME" CHAR(8) , 
		  "CRT_TIME" CHAR(8) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_DIST_PLAN"

ALTER TABLE "ICA_DIST_PLAN" 
	ADD CONSTRAINT "ICA_DIST_PLAN_PK" PRIMARY KEY
		("PLAN_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_CO"
------------------------------------------------
 

CREATE TABLE "ICA_CO"  (
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ISS_DATE" VARCHAR(8) NOT NULL , 
		  "RCPT_DATE" VARCHAR(8) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "AGREE_NUM" VARCHAR(30) , 
		  "PLAN_TYPE" CHAR(2) NOT NULL , 
		  "STATUS" CHAR(2) NOT NULL , 
		  "UM_ID" CHAR(2) NOT NULL WITH DEFAULT '0' , 
		  "CC_WHSE_ID" VARCHAR(30) , 
		  "RC_WHSE_ID" VARCHAR(30) , 
		  "QTY_REQ" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CALC" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_EXP" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CFM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "CRT_USER_ID" VARCHAR(30) , 
		  "CRT_USER_NAME" VARCHAR(30) , 
		  "CRT_DATE" CHAR(8) , 
		  "SHARE_DATE" VARCHAR(8) , 
		  "SHARE_USER_ID" VARCHAR(30) , 
		  "SHARE_USER_NAME" VARCHAR(20) , 
		  "CFM_OPINION" VARCHAR(100) , 
		  "CFM_DATE" VARCHAR(8) , 
		  "CFM_USER_ID" VARCHAR(30) , 
		  "CFM_USER_NAME" VARCHAR(20) , 
		  "ISS_OPINION" VARCHAR(100) , 
		  "SUBMIT_DATE" CHAR(8) , 
		  "SUBMIT_USER_ID" VARCHAR(30) , 
		  "SUBMIT_USER_NAME" VARCHAR(20) , 
		  "FEEDBACK_OPINION" VARCHAR(100) , 
		  "APPROVE_DATE" VARCHAR(8) , 
		  "APPROVE_USER_ID" VARCHAR(30) , 
		  "APPROVE_USER_NAME" VARCHAR(20) , 
		  "APPROVE_TIME" CHAR(8) , 
		  "SUBMIT_TIME" CHAR(8) , 
		  "CFM_TIME" CHAR(8) , 
		  "SHARE_TIME" CHAR(8) , 
		  "CRT_TIME" CHAR(8) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' , 
		  "QTY_ARE" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_CO"

ALTER TABLE "ICA_CO" 
	ADD CONSTRAINT "ICA_CO_PK" PRIMARY KEY
		("CO_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_CO_LINE"
------------------------------------------------
 

CREATE TABLE "ICA_CO_LINE"  (
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_REQ" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CALC" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_EXP" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CFM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' , 
		  "QTY_ARE" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_CO_LINE"

ALTER TABLE "ICA_CO_LINE" 
	ADD CONSTRAINT "ICA_CO_LINE_PK" PRIMARY KEY
		("CO_ID",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_MONTH_PPLAN_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_MONTH_PPLAN_ITEM"  (
		  "PLAN_ID" VARCHAR(20) NOT NULL , 
		  "FACT_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_PRO" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_MONTH_PPLAN_ITEM"

ALTER TABLE "ICA_MONTH_PPLAN_ITEM" 
	ADD CONSTRAINT "ICA_MONTH_PPLAN_ITEM_PK" PRIMARY KEY
		("PLAN_ID",
		 "FACT_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_MONTH_PPLAN"
------------------------------------------------
 

CREATE TABLE "ICA_MONTH_PPLAN"  (
		  "PLAN_ID" VARCHAR(20) NOT NULL , 
		  "PLAN_MONTH" CHAR(6) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "STATUS" CHAR(2) WITH DEFAULT '01' , 
		  "CRT_ORGAN_ID" VARCHAR(30) , 
		  "CRT_DATE" VARCHAR(12) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_MONTH_PPLAN"

ALTER TABLE "ICA_MONTH_PPLAN" 
	ADD CONSTRAINT "ICA_MONTH_PPLAN_PK" PRIMARY KEY
		("PLAN_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_MONTH_REQ_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_MONTH_REQ_ITEM"  (
		  "REQ_ID" VARCHAR(20) NOT NULL , 
		  "ROW_NO" INTEGER NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_REQ" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_FORE" DECIMAL(18,6) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_MONTH_REQ_ITEM"

ALTER TABLE "ICA_MONTH_REQ_ITEM" 
	ADD CONSTRAINT "ICA_MONTH_REQ_ITEM_PK" PRIMARY KEY
		("REQ_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_WEEK_REQ"
------------------------------------------------
 

CREATE TABLE "ICA_WEEK_REQ"  (
		  "REQ_ID" VARCHAR(20) NOT NULL , 
		  "REQ_MONTH" CHAR(6) NOT NULL , 
		  "REQ_WEEK" CHAR(7) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "STATUS" CHAR(1) NOT NULL WITH DEFAULT '0' , 
		  "CRT_ORGAN_ID" VARCHAR(30) , 
		  "CRT_DATE" VARCHAR(14) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT 'SD0000000000001' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_WEEK_REQ"

ALTER TABLE "ICA_WEEK_REQ" 
	ADD PRIMARY KEY
		("REQ_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_WEEK_REQ_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_WEEK_REQ_ITEM"  (
		  "REQ_ID" VARCHAR(20) NOT NULL , 
		  "ISS_DATE" VARCHAR(8) NOT NULL , 
		  "RCPT_DATE" VARCHAR(8) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_REQ" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_WEEK_REQ_ITEM"

ALTER TABLE "ICA_WEEK_REQ_ITEM" 
	ADD PRIMARY KEY
		("REQ_ID",
		 "RCPT_DATE",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ISS_PLAN"
------------------------------------------------
 

CREATE TABLE "ICA_ISS_PLAN"  (
		  "CONTR_ID" VARCHAR(8) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "PLAN_ISS_DATE" VARCHAR(8) NOT NULL , 
		  "PLAN_RCPT_DATE" VARCHAR(8) NOT NULL , 
		  "ISS_WHSE_ID" VARCHAR(30) , 
		  "ISS_WHSE_NAME" VARCHAR(100) , 
		  "RCPT_WHSE_ID" VARCHAR(30) , 
		  "RCPT_WHSE_NAME" VARCHAR(100) , 
		  "TRAN_TYPE_ID" VARCHAR(10) , 
		  "STATUS" CHAR(2) NOT NULL WITH DEFAULT '01' , 
		  "NOTE" VARCHAR(500) , 
		  "ISS_DATE" VARCHAR(8) , 
		  "CAR_NO" VARCHAR(20) , 
		  "DRIVER_NAME" VARCHAR(20) , 
		  "DRIVER_TELE" VARCHAR(20) , 
		  "ISS_CFM_ORGAN_ID" VARCHAR(30) , 
		  "ISS_CFM_DATE" VARCHAR(8) , 
		  "RCPT_DATE" VARCHAR(8) , 
		  "RCPT_CFM_TYPE" CHAR(2) WITH DEFAULT '00' , 
		  "RCPT_CFM_ORGAN_ID" VARCHAR(30) , 
		  "RCPT_CFM_DATE" VARCHAR(8) , 
		  "WARNING_PLAN_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_ISS_PLAN"

ALTER TABLE "ICA_ISS_PLAN" 
	ADD CONSTRAINT "ICA_ISS_PLAN_PK" PRIMARY KEY
		("CONTR_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_AGREEMENT_ITEM_LIST"
------------------------------------------------
 

CREATE TABLE "ICA_AGREEMENT_ITEM_LIST"  (
		  "LIST_ID" VARCHAR(30) NOT NULL , 
		  "STAND_NUM" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "QUANTITY" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "DOWN_DATE" VARCHAR(8) NOT NULL )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_AGREEMENT_ITEM_LIST"

ALTER TABLE "ICA_AGREEMENT_ITEM_LIST" 
	ADD CONSTRAINT "ICA_AGREEMENT_ITEM_LIST_PK" PRIMARY KEY
		("LIST_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_AGREE_LINE"
------------------------------------------------
 

CREATE TABLE "ICA_AGREE_LINE"  (
		  "AGREE_NUM" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "OLD_QTY_ORD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_ORD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CUM" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_AGREE_LINE"

ALTER TABLE "ICA_AGREE_LINE" 
	ADD CONSTRAINT "ICA_AGREE_LINE_PK" PRIMARY KEY
		("AGREE_NUM",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_AGREE_LINE_LIST"
------------------------------------------------
 

CREATE TABLE "ICA_AGREE_LINE_LIST"  (
		  "LIST_ID" VARCHAR(30) NOT NULL , 
		  "STAND_NUM" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "QUANTITY" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "DOWN_DATE" VARCHAR(8) NOT NULL )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_AGREE_LINE_LIST"

ALTER TABLE "ICA_AGREE_LINE_LIST" 
	ADD CONSTRAINT "ICA_AGREE_LINE_LIST_PK" PRIMARY KEY
		("LIST_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_DOWNLOAD_LOG"
------------------------------------------------
 

CREATE TABLE "ICA_DOWNLOAD_LOG"  (
		  "REF_ID" VARCHAR(30) NOT NULL , 
		  "TYPE" CHAR(2) NOT NULL , 
		  "NOTE" VARCHAR(2000) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_DOWNLOAD_LOG"

ALTER TABLE "ICA_DOWNLOAD_LOG" 
	ADD PRIMARY KEY
		("REF_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM"
------------------------------------------------
 

CREATE TABLE "ICA_COM"  (
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "COM_NAME" VARCHAR(100) NOT NULL , 
		  "COM_SHORT_NAME" VARCHAR(100) NOT NULL , 
		  "IS_IMPORTED" CHAR(1) NOT NULL , 
		  "SALE_CENTER_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "COM_ADDR" VARCHAR(80) , 
		  "CORPORATION" VARCHAR(10) , 
		  "HOMEPAGE" VARCHAR(50) , 
		  "TEL" VARCHAR(40) , 
		  "FAX" VARCHAR(40) , 
		  "TRANS_TYPE" CHAR(2) WITH DEFAULT '04' , 
		  "COM_TYPE" CHAR(2) , 
		  "ACCOUNT_BANK" VARCHAR(50) , 
		  "ACCOUNT" VARCHAR(20) , 
		  "TAXPAYER_ID" VARCHAR(20) , 
		  "ACCOUNT_BANK_INV" VARCHAR(50) , 
		  "ACCOUNT_INV" VARCHAR(20) , 
		  "TAXPAYER_ID_INV" VARCHAR(20) , 
		  "REC_TYPE" CHAR(1) , 
		  "STATUS" CHAR(2) NOT NULL WITH DEFAULT '01' , 
		  "IS_MONOPOLY_PUH" CHAR(1) NOT NULL , 
		  "IS_CONN" CHAR(1) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL WITH DEFAULT '' )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_COM"

ALTER TABLE "ICA_COM" 
	ADD CONSTRAINT "ICA_COM_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_WHSE"
------------------------------------------------
 

CREATE TABLE "ICA_WHSE"  (
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "WHSE_NAME" VARCHAR(100) NOT NULL , 
		  "WHSE_ADDR" VARCHAR(100) NOT NULL , 
		  "IS_USE" CHAR(1) NOT NULL WITH DEFAULT '1' , 
		  "NOTE" VARCHAR(30) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_WHSE"

ALTER TABLE "ICA_WHSE" 
	ADD CONSTRAINT "ICA_WHSE_PK" PRIMARY KEY
		("WHSE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_AGREEMENT_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_AGREEMENT_ITEM"  (
		  "AGREE_NUM" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "OLD_QTY_ORD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_ORD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_CUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_AGREEMENT_ITEM"

ALTER TABLE "ICA_AGREEMENT_ITEM" 
	ADD CONSTRAINT "ICA_AGREEMENT_ITEM_PK" PRIMARY KEY
		("AGREE_NUM",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ISS_LOSS"
------------------------------------------------
 

CREATE TABLE "ICA_ISS_LOSS"  (
		  "CONTR_ID" VARCHAR(8) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "LINE_NUM" INTEGER , 
		  "QTY" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "PRICE" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "AMT" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_ISS_LOSS"

ALTER TABLE "ICA_ISS_LOSS" 
	ADD CONSTRAINT "ICA_ISS_LOSS_PK" PRIMARY KEY
		("CONTR_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_CONTRACT"
------------------------------------------------
 

CREATE TABLE "ICA_CONTRACT"  (
		  "CONTR_ID" VARCHAR(8) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) NOT NULL , 
		  "AREA_ID" VARCHAR(30) NOT NULL , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "STAND_NUM" VARCHAR(50) , 
		  "CONTR_DATE" CHAR(6) NOT NULL , 
		  "MONTH1" CHAR(6) , 
		  "AGREE_NUM" VARCHAR(30) , 
		  "FACT_ID" VARCHAR(30) NOT NULL , 
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "TRANSPORT_TYPE" CHAR(1) , 
		  "TRAN_TYPE_ID" VARCHAR(30) , 
		  "REC_TYPE" CHAR(1) , 
		  "P_WHSE_ID" VARCHAR(30) , 
		  "CC_WHSE_ID" VARCHAR(30) , 
		  "RC_WHSE_ID" VARCHAR(30) , 
		  "PLAN_ISS_DATE" CHAR(8) , 
		  "PLAN_RCPT_DATE" CHAR(8) , 
		  "STATUS" CHAR(2) , 
		  "CRT_DATE" CHAR(8) , 
		  "CRT_USER_ID" VARCHAR(30) , 
		  "CRT_USER_NAME" VARCHAR(20) , 
		  "UP_USER_ID" VARCHAR(30) , 
		  "UP_USER_NAME" VARCHAR(20) , 
		  "UP_DATE" CHAR(8) , 
		  "UP_TIME" CHAR(8) , 
		  "CFM_USER_ID" VARCHAR(30) , 
		  "CFM_USER_NAME" VARCHAR(20) , 
		  "CONFIRM_DATE" CHAR(8) , 
		  "CONFIRM_TIME" CHAR(8) , 
		  "INVO_USER_ID" VARCHAR(30) , 
		  "INVO_USER_NAME" VARCHAR(20) , 
		  "INVO_DATE" CHAR(8) , 
		  "INVO_TIME" CHAR(8) , 
		  "SEND_USER_ID" VARCHAR(30) , 
		  "SEND_USER_NAME" VARCHAR(20) , 
		  "SEND_DATE" CHAR(8) , 
		  "SEND_TIME" CHAR(8) , 
		  "RECE_USER_ID" VARCHAR(30) , 
		  "RECE_USER_NAME" VARCHAR(20) , 
		  "RECE_DATE" CHAR(8) , 
		  "RECE_TIME" CHAR(8) , 
		  "ORDER_USER_ID" VARCHAR(30) , 
		  "ORDER_USER_NAME" VARCHAR(20) , 
		  "ORDER_DATE" CHAR(8) , 
		  "ORDER_TIME" CHAR(25) , 
		  "POSE_USER_ID" VARCHAR(30) , 
		  "POSE_USER_NAME" VARCHAR(20) , 
		  "POSE_DATE" CHAR(8) , 
		  "POSE_TIME" CHAR(8) , 
		  "DELI_DATE_BEGIN" VARCHAR(8) , 
		  "DELI_DATE_END" VARCHAR(8) , 
		  "IS_SIGNED" CHAR(1) , 
		  "SIGN_DATE" VARCHAR(8) , 
		  "SIGNER" VARCHAR(30) , 
		  "CANCEL_USER_ID" VARCHAR(30) , 
		  "CANCEL_USER_NAME" VARCHAR(20) , 
		  "CANCEL_DATE" VARCHAR(8) , 
		  "CANCEL_TIME" CHAR(8) , 
		  "REJECT_USER_ID" VARCHAR(30) , 
		  "REJECT_USER_NAME" VARCHAR(20) , 
		  "REJECT_DATE" VARCHAR(8) , 
		  "REJECT_TIME" CHAR(8) , 
		  "SUP_ID" VARCHAR(30) , 
		  "REQ_ID" VARCHAR(30) , 
		  "SUP_DEP" VARCHAR(10) , 
		  "REQ_DEP" VARCHAR(10) , 
		  "INVOICE_ID" VARCHAR(30) , 
		  "PASS_ID" VARCHAR(20) , 
		  "UPDATE_TIME" TIMESTAMP , 
		  "QTY_SUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "AMT_NUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "NOTE" VARCHAR(50) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_CONTRACT"

ALTER TABLE "ICA_CONTRACT" 
	ADD PRIMARY KEY
		("CONTR_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ITEM_TEMP"
------------------------------------------------
 

CREATE TABLE "ICA_ITEM_TEMP"  (
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_NAME" VARCHAR(50) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "STANDARD_CODE" VARCHAR(30) , 
		  "PACK_BAR" VARCHAR(30) NOT NULL , 
		  "BOX_BAR" VARCHAR(30) , 
		  "BIGBOX_BAR" VARCHAR(30) , 
		  "BRAND_ID" VARCHAR(30) , 
		  "UM_ID" CHAR(2) WITH DEFAULT '01' , 
		  "UM_WHSE" CHAR(2) WITH DEFAULT '01' , 
		  "UM_SALE" CHAR(2) WITH DEFAULT '01' , 
		  "UM_INVOICE" CHAR(2) WITH DEFAULT '01' , 
		  "H_SIZE" DECIMAL(20,2) WITH DEFAULT 20 , 
		  "T_SIZE" DECIMAL(20,2) WITH DEFAULT 200 , 
		  "J_SIZE" DECIMAL(20,2) WITH DEFAULT 10000 , 
		  "W_SIZE" DECIMAL(20,2) WITH DEFAULT 10000 , 
		  "X_SIZE" DECIMAL(20,2) WITH DEFAULT 50000 , 
		  "PRICE_PUH_TAX" DECIMAL(18,6) , 
		  "PRICE_PUH_NO_TAX" DECIMAL(18,6) , 
		  "SPEC" VARCHAR(20) , 
		  "KIND" CHAR(1) , 
		  "PACK_KIND" CHAR(1) , 
		  "PRODUCT_TYPE" CHAR(2) , 
		  "TAX_ID" VARCHAR(30) , 
		  "TAR_CONT" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "GAS_NICOTINE" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "CO_CONT" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "BRD_KIND" CHAR(1) WITH DEFAULT '0' , 
		  "BRD_KEY" CHAR(1) WITH DEFAULT '0' , 
		  "IS_HUNDREDBRAND" CHAR(1) WITH DEFAULT '1' , 
		  "IS_LOWEND" CHAR(1) WITH DEFAULT '1' , 
		  "IS_RARE" CHAR(1) WITH DEFAULT '0' , 
		  "IS_MATURE" CHAR(1) WITH DEFAULT '0' , 
		  "IS_THIN" CHAR(1) , 
		  "IS_TALL" CHAR(1) , 
		  "IS_POOL" CHAR(1) NOT NULL WITH DEFAULT '0' , 
		  "SEQ_CODE" INTEGER , 
		  "IS_USE" CHAR(1) NOT NULL WITH DEFAULT '1' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 






------------------------------------------------
-- DDL Statements for Table "ICA_COM_SALE_LINE_TEP"
------------------------------------------------
 

CREATE TABLE "ICA_COM_SALE_LINE_TEP"  (
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "DATE1" CHAR(8) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "QTY_IOD" DECIMAL(20,6) , 
		  "QTY_PURCH" DECIMAL(20,6) , 
		  "QTY_SOLD" DECIMAL(20,6) , 
		  "QTY_EOD" DECIMAL(20,6) , 
		  "QTY_IOD_T" DECIMAL(20,6) , 
		  "QTY_PURCH_T" DECIMAL(20,6) , 
		  "QTY_SOLD_T" DECIMAL(20,6) , 
		  "QTY_EOD_T" DECIMAL(20,6) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 






------------------------------------------------
-- DDL Statements for Table "ICA_PARMS"
------------------------------------------------
 

CREATE TABLE "ICA_PARMS"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "DIST_TYPE" CHAR(2) NOT NULL , 
		  "DIST_PERIOD" CHAR(2) , 
		  "RCPT_DATE" VARCHAR(20) , 
		  "DIST_DAYS" INTEGER WITH DEFAULT 0 , 
		  "TRANSIT_DAYS" INTEGER WITH DEFAULT 0 , 
		  "CUST_DAYS" INTEGER WITH DEFAULT 0 , 
		  "AVERAGE_SALES_DAYS" INTEGER WITH DEFAULT 0 , 
		  "PRI_DAYS" INTEGER WITH DEFAULT 0 , 
		  "ADVANCE_DAYS" INTEGER WITH DEFAULT 0 , 
		  "BEGIN_DATE" CHAR(8) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_PARMS"

ALTER TABLE "ICA_PARMS" 
	ADD CONSTRAINT "ICA_PARMS_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_DISTDAY"
------------------------------------------------
 

CREATE TABLE "ICA_COM_DISTDAY"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "DIST_DATE" CHAR(8) NOT NULL , 
		  "ISS_DATE" CHAR(8) NOT NULL , 
		  "CRT_DATE" CHAR(8) NOT NULL , 
		  "PRI_DAYS" INTEGER , 
		  "ADVANCE_DAYS" INTEGER WITH DEFAULT 0 , 
		  "BEGIN_DATE" CHAR(8) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_COM_DISTDAY"

ALTER TABLE "ICA_COM_DISTDAY" 
	ADD CONSTRAINT "ICA_COM_DISTDAY_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID",
		 "DIST_DATE");



------------------------------------------------
-- DDL Statements for Table "ICA_ITEM_PARMS"
------------------------------------------------
 

CREATE TABLE "ICA_ITEM_PARMS"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "RATE_LOWER_LIMIT" INTEGER WITH DEFAULT 0 , 
		  "RATE_UPPER_LIMIT" INTEGER WITH DEFAULT 0 , 
		  "RATE_WARNING1" INTEGER WITH DEFAULT 0 , 
		  "RATE_WARNING2" INTEGER WITH DEFAULT 0 , 
		  "RATE_WARNING3" INTEGER WITH DEFAULT 0 )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_ITEM_PARMS"

ALTER TABLE "ICA_ITEM_PARMS" 
	ADD CONSTRAINT "ICA_ITEM_PARMS_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_COM_ITEM"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "FULL_NAME" VARCHAR(100) , 
		  "QTY_IN_TRANSIT" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_ALLOCCO" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "IS_NEW" CHAR(1) WITH DEFAULT '0' , 
		  "IS_USE" CHAR(1) WITH DEFAULT '1' )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_COM_ITEM"

ALTER TABLE "ICA_COM_ITEM" 
	ADD CONSTRAINT "ICA_COM_ITEM_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_DIST_WARNING"
------------------------------------------------
 

CREATE TABLE "ICA_DIST_WARNING"  (
		  "WARNING_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "WARNING_DATE" CHAR(8) NOT NULL , 
		  "BASE_STORE_DATE" CHAR(8) NOT NULL , 
		  "WARNING_LEVEL" CHAR(1) NOT NULL , 
		  "WARNING_TYPE" VARCHAR(2) , 
		  "STATUS" CHAR(1) WITH DEFAULT '0' , 
		  "DEAL_RESULT" CHAR(1) , 
		  "PLAN_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_DIST_WARNING"

ALTER TABLE "ICA_DIST_WARNING" 
	ADD CONSTRAINT "ICA_DIST_WARNING_PK" PRIMARY KEY
		("WARNING_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ITEM_DAY_STU"
------------------------------------------------
 

CREATE TABLE "ICA_ITEM_DAY_STU"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "DATE1" CHAR(8) NOT NULL , 
		  "RATE" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "WARNING_LEVEL" CHAR(1) , 
		  "WARNING_TYPE" VARCHAR(2) , 
		  "QTY_SUGGEST" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_AVR_DAY" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "RATE_UPPER_LIMIT" INTEGER WITH DEFAULT 0 , 
		  "QTY_EOD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_ITEM_DAY_STU"

ALTER TABLE "ICA_ITEM_DAY_STU" 
	ADD CONSTRAINT "ICA_ITEM_DAY_STU_PK" PRIMARY KEY
		("ICOM_ID",
		 "COM_ID",
		 "ITEM_ID",
		 "DATE1");



------------------------------------------------
-- DDL Statements for Table "ICA_DIST_WARNING_LOG"
------------------------------------------------
 

CREATE TABLE "ICA_DIST_WARNING_LOG"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "WARNING_DATE" VARCHAR(8) NOT NULL , 
		  "STATUS" CHAR(1) , 
		  "NOTE" VARCHAR(1024) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_DIST_WARNING_LOG"

ALTER TABLE "ICA_DIST_WARNING_LOG" 
	ADD CONSTRAINT "ICA_DIST_WARNING_LOG_PK" PRIMARY KEY
		("ICOM_ID",
		 "WARNING_DATE");



------------------------------------------------
-- DDL Statements for Table "ICA_WEEK"
------------------------------------------------
 

CREATE TABLE "ICA_WEEK"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "PRI_WEEK" CHAR(7) NOT NULL , 
		  "PRI_MONTH" CHAR(6) NOT NULL , 
		  "PRI_YEAR" CHAR(4) NOT NULL , 
		  "WEEK_NAME" VARCHAR(50) NOT NULL , 
		  "BEGIN_DATE" CHAR(8) NOT NULL , 
		  "END_DATE" CHAR(8) NOT NULL , 
		  "DAY_NUM" INTEGER NOT NULL , 
		  "WEEK_OF_YEAR" INTEGER NOT NULL )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_WEEK"

ALTER TABLE "ICA_WEEK" 
	ADD CONSTRAINT "ICA_WEEK_PK" PRIMARY KEY
		("ICOM_ID",
		 "PRI_WEEK");



------------------------------------------------
-- DDL Statements for Table "ICA_CO_ALLOT_LINE"
------------------------------------------------
 

CREATE TABLE "ICA_CO_ALLOT_LINE"  (
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_CFM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "COM_ID" VARCHAR(30) , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "WHSE_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 






------------------------------------------------
-- DDL Statements for Table "ICA_PLAN_HISOPIN"
------------------------------------------------
 

CREATE TABLE "ICA_PLAN_HISOPIN"  (
		  "OPINION_ID" VARCHAR(30) NOT NULL , 
		  "PLAN_ID" VARCHAR(30) , 
		  "ICOM_ID" VARCHAR(30) , 
		  "COM_ID" VARCHAR(30) , 
		  "PLAN_TYPE" CHAR(2) , 
		  "DEAL_DATE" CHAR(8) , 
		  "DEAL_TIME" CHAR(8) , 
		  "DEAL_USER_NAME" VARCHAR(20) , 
		  "CRT_DATE" CHAR(8) , 
		  "CRT_TIME" CHAR(8) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_PLAN_HISOPIN"

ALTER TABLE "ICA_PLAN_HISOPIN" 
	ADD CONSTRAINT "ICA_PLAN_HISOPIN_PK" PRIMARY KEY
		("OPINION_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_PLAN_HISOPIN_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_PLAN_HISOPIN_ITEM"  (
		  "OPINION_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) , 
		  "PLAN_ID" VARCHAR(30) , 
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "QTY_EXP" DECIMAL(18,6) , 
		  "QTY_DIST" DECIMAL(18,6) , 
		  "OPINION_TYPE" CHAR(2) , 
		  "OPINION_NAME" VARCHAR(20) , 
		  "OPINION_CONTENT" VARCHAR(100) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_PLAN_HISOPIN_ITEM"

ALTER TABLE "ICA_PLAN_HISOPIN_ITEM" 
	ADD CONSTRAINT "ICA_PLAN_HISOPIN_ITEM_PK" PRIMARY KEY
		("OPINION_ID",
		 "ITEM_ID",
		 "CO_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_WHSE_ITEM_STORE"
------------------------------------------------
 

CREATE TABLE "ICA_WHSE_ITEM_STORE"  (
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "QTY_STORE" DECIMAL(20,6) , 
		  "QTY_ALLOCCO" DECIMAL(20,6) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_WHSE_ITEM_STORE"

ALTER TABLE "ICA_WHSE_ITEM_STORE" 
	ADD CONSTRAINT "ICA_WHSE_ITEM_STORE_PK" PRIMARY KEY
		("WHSE_ID",
		 "ITEM_ID",
		 "GRADE_ID",
		 "ICOM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ICOM_EXT"
------------------------------------------------
 

CREATE TABLE "ICA_ICOM_EXT"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "SUP_ID" VARCHAR(30) , 
		  "SUP_DEP" VARCHAR(10) , 
		  "S_NAME" VARCHAR(60) , 
		  "S_ADDR" VARCHAR(60) , 
		  "S_TELE" VARCHAR(20) , 
		  "S_BANK_ID" VARCHAR(30) , 
		  "S_BANK" VARCHAR(60) , 
		  "S_TAX" VARCHAR(18) , 
		  "SECRET_KEY" VARCHAR(100) , 
		  "AGREE_SERV_URL" VARCHAR(200) , 
		  "SHORT_CODE" VARCHAR(2) , 
		  "CON_ACCESS_URL" VARCHAR(200) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_ICOM_EXT"

ALTER TABLE "ICA_ICOM_EXT" 
	ADD PRIMARY KEY
		("ICOM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_ITEM_GRADE"
------------------------------------------------
 

CREATE TABLE "ICA_ITEM_GRADE"  (
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_NAME" VARCHAR(30) , 
		  "FULL_NAME" VARCHAR(100) , 
		  "IS_USE" CHAR(1) WITH DEFAULT '1' , 
		  "IS_DEFAULT" CHAR(1) WITH DEFAULT '1' )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_ITEM_GRADE"

ALTER TABLE "ICA_ITEM_GRADE" 
	ADD CONSTRAINT "ICA_ITEM_GRADE_PK" PRIMARY KEY
		("GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_CONTRACT_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_CONTRACT_ITEM"  (
		  "CONTR_ID" VARCHAR(8) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "LINE_NUM" VARCHAR(10) , 
		  "QTY_ORD" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "PRI_TAX" DECIMAL(18,6) WITH DEFAULT 0.0 , 
		  "AMT_TAX" DECIMAL(18,6) WITH DEFAULT 0.0 )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_CONTRACT_ITEM"

ALTER TABLE "ICA_CONTRACT_ITEM" 
	ADD CONSTRAINT "ICA_CONTRACT_ITEM_PK" PRIMARY KEY
		("CONTR_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_WHSE_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_WHSE_ITEM"  (
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "IS_DEFAULT" CHAR(1) , 
		  "ICOM_ID" VARCHAR(30) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_WHSE_ITEM"

ALTER TABLE "ICA_WHSE_ITEM" 
	ADD PRIMARY KEY
		("WHSE_ID",
		 "ITEM_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_SUPPLY_PLAN"
------------------------------------------------
 

CREATE TABLE "ICA_SUPPLY_PLAN"  (
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "DATE_TYPE" VARCHAR(3) NOT NULL , 
		  "DATE1" VARCHAR(6) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SUPPLY" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "STATUS" CHAR(1) WITH DEFAULT '0' , 
		  "CFM_DATE" CHAR(8) , 
		  "CFM_TIME" CHAR(8) , 
		  "CFM_USER_ID" VARCHAR(30) , 
		  "CFM_USER_NAME" VARCHAR(20) , 
		  "SHARE_DATE" CHAR(8) , 
		  "SHARE_TIME" CHAR(8) , 
		  "SHARE_USER_ID" VARCHAR(30) , 
		  "SHARE_USER_NAME" VARCHAR(20) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_SUPPLY_PLAN"

ALTER TABLE "ICA_SUPPLY_PLAN" 
	ADD CONSTRAINT "ICA_SUPPLY_PLAN_PK" PRIMARY KEY
		("PLAN_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_REQ_FORE"
------------------------------------------------
 

CREATE TABLE "ICA_REQ_FORE"  (
		  "FORE_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "DATE_TYPE" VARCHAR(3) NOT NULL , 
		  "DATE1" VARCHAR(6) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_MODEL" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_FORE" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "STATUS" CHAR(1) WITH DEFAULT '0' , 
		  "CFM_DATE" CHAR(8) , 
		  "CFM_TIME" CHAR(8) , 
		  "CFM_USER_ID" VARCHAR(30) , 
		  "CFM_USER_NAME" VARCHAR(20) )   
		 IN "TD_SALE" INDEX IN "TD_BASE_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_REQ_FORE"

ALTER TABLE "ICA_REQ_FORE" 
	ADD CONSTRAINT "ICA_REQ_FORE_PK" PRIMARY KEY
		("FORE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_SUPPLY_PLAN_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_SUPPLY_PLAN_ITEM"  (
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_SUPPLY" DECIMAL(18,6) WITH DEFAULT 0 )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_SUPPLY_PLAN_ITEM"

ALTER TABLE "ICA_SUPPLY_PLAN_ITEM" 
	ADD CONSTRAINT "ICA_SUPPLY_PLAN_ITEM_PK" PRIMARY KEY
		("PLAN_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_REQ_FORE_ITEM"
------------------------------------------------
 

CREATE TABLE "ICA_REQ_FORE_ITEM"  (
		  "FORE_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "QTY_MODEL" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "QTY_FORE" DECIMAL(18,6) )   
		 IN "TD_SALE" INDEX IN "TD_BASE_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_REQ_FORE_ITEM"

ALTER TABLE "ICA_REQ_FORE_ITEM" 
	ADD CONSTRAINT "ICA_REQ_FORE_ITEM_PK" PRIMARY KEY
		("FORE_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_CO_ALLOT"
------------------------------------------------
 

CREATE TABLE "ICA_CO_ALLOT"  (
		  "CO_ID" VARCHAR(30) NOT NULL , 
		  "WHSE_ID" VARCHAR(30) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "PLAN_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) , 
		  "ISS_DATE" CHAR(8) , 
		  "RCPT_DATE" CHAR(8) , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "ALLOCATE_SUM" DECIMAL(18,6) WITH DEFAULT 0 , 
		  "PLAN_TYPE" CHAR(2) , 
		  "STATUS" CHAR(2) , 
		  "UM_ID" CHAR(2) , 
		  "CC_WHSE_ID" VARCHAR(30) , 
		  "RC_WHSE_ID" VARCHAR(30) , 
		  "CRT_DATE" VARCHAR(8) , 
		  "CRT_USER_ID" VARCHAR(30) , 
		  "CRT_USER_NAME" VARCHAR(20) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_CO_ALLOT"

ALTER TABLE "ICA_CO_ALLOT" 
	ADD CONSTRAINT "ICA_CO_ALLOT_PK" PRIMARY KEY
		("CO_ID",
		 "WHSE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_ITEM_MONTH"
------------------------------------------------
 

CREATE TABLE "ICA_COM_ITEM_MONTH"  (
		  "DATE1" CHAR(6) NOT NULL , 
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "SALE_CENTER_ID" VARCHAR(30) , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SOLD" DECIMAL(18,2) )   
		 IN "TD_SALE"  INDEX IN "TD_OTHER_IDX"; 


-- DDL Statements for Primary Key on Table "ICA_COM_ITEM_MONTH"

ALTER TABLE "ICA_COM_ITEM_MONTH" 
	ADD CONSTRAINT "ICA_COM_ITEM_MONTH_PK" PRIMARY KEY
		("DATE1",
		 "ICOM_ID",
		 "COM_ID",
		 "ITEM_ID",
		 "GRADE_ID");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_SERVICE"
------------------------------------------------
 

CREATE TABLE "ICA_COM_SERVICE"  (
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "SERVICE_TYPE" VARCHAR(30) NOT NULL , 
		  "SERVICE_URL" VARCHAR(50) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


-- DDL Statements for Primary Key on Table "ICA_COM_SERVICE"

ALTER TABLE "ICA_COM_SERVICE" 
	ADD CONSTRAINT "ICA_COM_SERVICE_PK" PRIMARY KEY
		("COM_ID",
		 "SERVICE_TYPE");



------------------------------------------------
-- DDL Statements for Table "ICA_COM_ITEM_MONTH_T"
------------------------------------------------
 

CREATE TABLE "ICA_COM_ITEM_MONTH_T"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "ITEM_ID" VARCHAR(30) NOT NULL , 
		  "GRADE_ID" VARCHAR(30) NOT NULL , 
		  "SALE_CENTER_ID" VARCHAR(30) , 
		  "SALEORG_ID" VARCHAR(30) , 
		  "AREA_ID" VARCHAR(30) , 
		  "SLSMAN_ID" VARCHAR(30) , 
		  "QTY_SOLD" DECIMAL(18,2) )   
		 IN "TD_SALE" INDEX IN "TD_OTHER_IDX" ; 


CREATE VIEW V_SCMR_PI_COM_DAY AS
SELECT
	A.PCOM_ID,
	A.CCOM_ID,
	A.PACK_BAR,
	A.COM_ID,
	A.ITEM_ID SCMR_ITEM_ID,
	B.ITEM_ID,
	A.DATE1,
	A.KIND,
	A.QTY_IOD QTY_IOD_TIAO,
	A.QTY_IOD*B.T_SIZE/B.X_SIZE QTY_IOD,
	A.AMT_IOD,
	A.AMT_PURCH,
	A.QTY_SOLD QTY_SOLD_TIAO,
	A.QTY_SOLD*B.T_SIZE/B.X_SIZE QTY_SOLD,
	A.AMT_SOLD,
	A.AMT_SOLD_NO_TAX,
	A.QTY_PROFIT QTY_PROFIT_TIAO,
	A.QTY_PROFIT*B.T_SIZE/B.X_SIZE QTY_PROFIT,
	A.AMT_PROFIT,
	A.QTY_LOSS QTY_LOSS_TIAO,
	A.QTY_LOSS*B.T_SIZE/B.X_SIZE QTY_LOSS,
	A.AMT_LOSS,
	A.QTY_EOD QTY_EOD_TIAO,
	A.QTY_EOD*B.T_SIZE/B.X_SIZE QTY_EOD,
	A.AMT_EOD,
	A.UNIT_COST,
	A.SUMCOST_SOLD SUMCOST_SOLD_TIAO,
	A.SUMCOST_SOLD*B.T_SIZE/B.X_SIZE SUMCOST_SOLD,
	A.GROSS_PROFIT,
	A.QTY_ALLOCATION,
	A.AMT_ALLOCATION,
	A.AMT_ALLOCATION_NO_TAX,
	A.GROSS_PROFIT_ALLOCATION,
	A.SUMCOST_SOLD_ALLOCATION,
	A.ITEM_KIND,
	B.ICOM_ID
FROM
	SCMR_PI_COM_DAY A
	LEFT JOIN ICA_ITEM B ON A.PACK_BAR=B.PACK_BAR;