CREATE TABLE ICA_COM_SERVICE(
	COM_ID VARCHAR(30) NOT NULL,
	SERVICE_TYPE VARCHAR(30) NOT NULL,
	SERVICE_URL VARCHAR(50)
)TABLESPACE "TD_SALE";
ALTER TABLE  "ICA_COM_SERVICE" 
	ADD CONSTRAINT ICA_COM_SERVICE_PK PRIMARY KEY
		("COM_ID","SERVICE_TYPE") USING INDEX TABLESPACE "TD_OTHER_IDX";