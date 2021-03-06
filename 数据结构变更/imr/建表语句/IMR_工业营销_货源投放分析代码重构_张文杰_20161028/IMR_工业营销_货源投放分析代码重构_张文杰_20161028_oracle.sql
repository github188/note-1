CREATE TABLE "IMR_ITEM_COMPETE"  (
		  "ICOM_ID" VARCHAR(30) NOT NULL , 
		  "PACK_BAR" VARCHAR(30) NOT NULL , 
		  "PCOM_ID" VARCHAR(30) NOT NULL , 
		  "COM_ID" VARCHAR(30) NOT NULL , 
		  "COMPETE_PACK_BAR" VARCHAR(30) NOT NULL,
		  "NOTE" VARCHAR(125) )TABLESPACE "TD_SALE" ;
ALTER TABLE "IMR_ITEM_COMPETE" 
	ADD CONSTRAINT "IMR_ITEM_COMPETE_PK" PRIMARY KEY
		("ICOM_ID",
		 "PACK_BAR",
		 "PCOM_ID",
		 "COM_ID",
		 "COMPETE_PACK_BAR") USING INDEX TABLESPACE "TD_OTHER_IDX";