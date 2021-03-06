CREATE TABLE CRM_MATERIEL(
	COM_ID VARCHAR2(30) NOT NULL,
	MATERIEL_ID VARCHAR2(30) NOT NULL,
	MATERIEL_NAME VARCHAR2(30) NOT NULL,
	UM_NAME VARCHAR2(8) NOT NULL,
	PRICE DECIMAL(18,4) NOT NULL
) TABLESPACE "TD_CRM" ;
ALTER TABLE "CRM_MATERIEL" 
	ADD CONSTRAINT "CRM_MATERIEL_PK" PRIMARY KEY
		("COM_ID",
		 "MATERIEL_ID")USING INDEX TABLESPACE "TD_OTHER_IDX";

CREATE TABLE CRM_MATERIEL_INVTY(
	COM_ID VARCHAR2(30) NOT NULL,
	ORGAN_TYPE VARCHAR2(10) NOT NULL,
	ORGAN_ID VARCHAR2(30) NOT NULL,
	MATERIEL_ID VARCHAR2(30) NOT NULL,
	QTY_INVTY DECIMAL(18,2) NOT NULL
) TABLESPACE "TD_CRM" ;
ALTER TABLE "CRM_MATERIEL_INVTY"
	ADD CONSTRAINT "CRM_MATERIEL_INVTY_PK" PRIMARY KEY
		("COM_ID",
		 "ORGAN_ID",
		 "MATERIEL_ID")USING INDEX TABLESPACE "TD_OTHER_IDX";

CREATE TABLE CRM_MATERIEL_STORAGE(
	STORAGE_NUM VARCHAR2(20) NOT NULL,
	COM_ID VARCHAR2(30) NOT NULL,
	ORGAN_TYPE VARCHAR2(10) NOT NULL,
	ORGAN_ID VARCHAR2(30) NOT NULL,
	CRT_DATE VARCHAR2(8) NOT NULL,
	STORAGE_TYPE VARCHAR2(2) NOT NULL,
	MATERIEL_ID VARCHAR2(30) NOT NULL,
	QTY_STORAGE DECIMAL(18,2) NOT NULL,
	QTY_INVTY DECIMAL(18,2) NOT NULL,
	CRT_USER VARCHAR2(30),
	NOTE VARCHAR2(50)
) TABLESPACE "TD_CRM" ;
ALTER TABLE "CRM_MATERIEL_STORAGE"
	ADD CONSTRAINT "CRM_MATERIEL_STORAGE_PK" PRIMARY KEY
		("STORAGE_NUM");
		
CREATE TABLE CRM_MATERIEL_STORAGE_LINE(
	STORAGE_NUM VARCHAR2(20) NOT NULL,
	ORGAN_TYPE VARCHAR2(10) NOT NULL,
	ORGAN_ID VARCHAR2(30) NOT NULL,
	QTY DECIMAL(18,2) NOT NULL
)  TABLESPACE "TD_CRM" ;
ALTER TABLE "CRM_MATERIEL_STORAGE_LINE"
	ADD CONSTRAINT "CRM_MATERIEL_STORAGE_LINE_PK" PRIMARY KEY
		("STORAGE_NUM",
		"ORGAN_ID")USING INDEX TABLESPACE "TD_OTHER_IDX";
	