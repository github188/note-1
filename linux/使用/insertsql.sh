#!/bin/sh
#insert into sql using script
#edit /etc/crontab,append "00 0 * * * root sh ${thisfilepath}"

db2 connect to v6db user db2inst1 using db2inst1

coms=(000000000000138 11210201C 11370101 11370701 11610101)
pcoms=('' 11210201P 11370001 11370001 11610001)

items=(6901028149242 6901028149365 6901028149921)
packbars=(6901028149242 6901028149365 6901028149921)

for((i=0;i<${#coms[@]};i++))
	do for((j=0;j<${#items[@]};j++))
		do db2 "INSERT INTO SCMR_PI_COM_DAY(PCOM_ID, CCOM_ID, COM_ID, PACK_BAR, ITEM_ID, DATE1, KIND, QTY_IOD, AMT_IOD, QTY_PURCH, AMT_PURCH, QTY_SOLD, AMT_SOLD, AMT_SOLD_NO_TAX, QTY_PROFIT, AMT_PROFIT, QTY_LOSS, AMT_LOSS, QTY_EOD, AMT_EOD, UNIT_COST, SUMCOST_SOLD, GROSS_PROFIT, QTY_ALLOCATION, AMT_ALLOCATION, AMT_ALLOCATION_NO_TAX, GROSS_PROFIT_ALLOCATION, SUMCOST_SOLD_ALLOCATION, ITEM_KIND) VALUES('${pcoms[i]}', '${coms[i]}', '${coms[i]}', '${packbars[j]}', '${items[j]}', to_char(CURRENT DATE,'YYYYMMDD'), '1', cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), 19.000000, cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), 0E-8, cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), cast(rand()*10000 as decimal(16,2)), '1')"
	done
done
db2 terminate