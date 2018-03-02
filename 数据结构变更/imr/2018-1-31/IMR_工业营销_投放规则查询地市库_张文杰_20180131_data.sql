
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('imr_myfsupplyq', '货源投放规则（马亚飞版）', 'imr_pc', 99, '6701', '1', '/pc/supplyCmd.cmd?method=luanQiBaZaoPCityItemSupplyInfo', '', '0', NULL, 1001, NULL, '11');




INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('imr_supplymyfQ', '货源投放规则（马亚飞版）', 'imr_myfsupplyq', '00', '1', 0);




INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150602588b501614b0734320031', '货源投放规则（马亚飞版）', '/pc/supplyCmd.cmd?method=luanQiBaZaoPCityItemSupplyInfo', 'imr_supplymyfQ', 'imr_myfsupplyq', 'http', NULL, 0);

  INSERT INTO ICA_ICOM_PARMS(ICOM_ID, PARM_KEY, PARM_VALUE, PARM_NAME, UPDATE_TIME, NOTE)
  VALUES(#{ICOM_ID}, 'BRDOWNER', '川', '通过工业公司编码获取在商业的供应商编码', '2018129', '为了通过名字模糊查询进行匹配，此处配置用于模糊查询的工业公司简称，比如四川中烟为 川，云南中烟为 云南');
