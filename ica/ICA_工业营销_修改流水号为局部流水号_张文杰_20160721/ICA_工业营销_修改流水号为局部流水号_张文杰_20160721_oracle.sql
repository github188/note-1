ALTER TABLE ICA_ICOM_EXT add SHORT_CODE VARCHAR(2);

CREATE TABLE ICA_PLAN_HISOPIN( 
OPINION_ID VARCHAR(30) NOT NULL, 
PLAN_ID VARCHAR(30), 
ICOM_ID VARCHAR(30), 
COM_ID VARCHAR(30), 
PLAN_TYPE CHAR(2), 
DEAL_DATE CHAR(8), 
DEAL_TIME CHAR(8), 
DEAL_USER_NAME VARCHAR(20), 
CRT_DATE CHAR(8), 
CRT_TIME CHAR(8) 
)TABLESPACE "TD_SALE";
ALTER TABLE "ICA_PLAN_HISOPIN" 
    ADD CONSTRAINT "ICA_PLAN_HISOPIN_PK" PRIMARY KEY ("OPINION_ID") USING INDEX TABLESPACE "TD_OTHER_IDX";

CREATE TABLE ICA_PLAN_HISOPIN_ITEM( 
OPINION_ID VARCHAR(30) NOT NULL, 
ITEM_ID VARCHAR(30) NOT NULL, 
GRADE_ID VARCHAR(30), 
PLAN_ID VARCHAR(30), 
CO_ID VARCHAR(30), 
QTY_EXP NUMERIC(18,6), 
QTY_DIST NUMERIC(18,6), 
OPINION_TYPE CHAR(2), 
OPINION_NAME VARCHAR(20), 
OPINION_CONTENT VARCHAR(100) 
)TABLESPACE "TD_SALE";
ALTER TABLE "ICA_PLAN_HISOPIN_ITEM" 
    ADD CONSTRAINT "ICA_PLAN_HISOPIN_ITEM_PK" PRIMARY KEY ("OPINION_ID","ITEM_ID") USING INDEX TABLESPACE "TD_OTHER_IDX";