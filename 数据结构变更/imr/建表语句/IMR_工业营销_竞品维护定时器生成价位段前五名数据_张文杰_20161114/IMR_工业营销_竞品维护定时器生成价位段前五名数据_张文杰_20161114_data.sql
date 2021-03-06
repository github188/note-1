--ICOM_ID是工业ID，初始化价位段表

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0001', '[0,24)', 0.00, 24.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0002', '[24,48)', 24.00, 48.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0003', '[48,70)', 48.00, 70.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0004', '[70,90)', 70.00, 90.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0005', '[90,113)', 90.00, 113.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0006', '[113,130)', 113.00, 130.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0007', '[130,150)', 130.00, 150.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0008', '[150,169)', 150.00, 169.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0009', '[169,190)', 169.00, 190.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0010', '[190,220)', 190.00, 220.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0011', '[220,250)', 220.00, 250.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0012', '[250,290)', 250.00, 290.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0013', '[290,380)', 290.00, 380.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0014', '[380,500)', 380.00, 500.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0015', '[500,600)', 500.00, 600.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0016', '[600,800)', 600.00, 800.00, NULL);

INSERT INTO IMR_PRICE_SEG
(ICOM_ID, PRICE_SEG_ID, PRICE_SEG_NAME, PRICE_FROM_VAL, PRICE_TO_VAL, NOTE)
VALUES(${ICOM_ID}, '0017', '[800,-)', 800.00, 9999.00, NULL);