CREATE TABLE ICA_SUPPLY_FEEDBACK_TEMPLATE(
	ICOM_ID VARCHAR(30) NOT NULL,
	TITLE VARCHAR(128) NOT NULL,
	CONTENT VARCHAR(200) NOT NULL,
	RN INTEGER NOT NULL
)IN TD_SALE INDEX IN TD_OTHER_IDX;
ALTER TABLE "ICA_SUPPLY_FEEDBACK_TEMPLATE" 
	ADD CONSTRAINT "ICA_SUPPLY_FDBK_TEMPLATE_PK" PRIMARY KEY(ICOM_ID,TITLE,CONTENT,RN);