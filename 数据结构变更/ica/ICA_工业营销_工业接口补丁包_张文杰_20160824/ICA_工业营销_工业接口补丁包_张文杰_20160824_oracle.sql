ALTER TABLE "ICA_PLAN_HISOPIN_ITEM"  DROP CONSTRAINT ICA_PLAN_HISOPIN_ITEM_PK;
alter table "ICA_PLAN_HISOPIN_ITEM" modify CO_ID not null; 
ALTER TABLE "ICA_PLAN_HISOPIN_ITEM" 
	ADD CONSTRAINT "ICA_PLAN_HISOPIN_ITEM_PK" PRIMARY KEY
		("OPINION_ID",
		 "ITEM_ID","CO_ID");