INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('ica_co_allot', '配货计划分解', 'ica_dingshipeihuo', 99, '26111', '1', '/dist/allot/coallot_query_init.cmd', '', '0', NULL, 1001, NULL, '11');
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('ica_allotaudit', '配货计划审核', 'ica_dingshipeihuo', 99, '26111', '1', '/dist/allot/coaudit_query_init.cmd', '', '0', NULL, 1001, NULL, '11');
INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('ica_co_allotQ', '配货计划分解', 'ica_co_allot', '00', '1', 0);
INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('ica_allotauditQ', '查询', 'ica_allotaudit', '00', '1', 99);
INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee815054a2f6050156d5119f7e00be', '配货计划分解', '/dist/allot/coallot_query_init.cmd', 'ica_co_allotQ', 'ica_co_allot', 'http', NULL, 0);
INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee815054a2f6050156d50f4ee600bd', '查询', '/dist/allot/coaudit_query_init.cmd', 'ica_allotauditQ', 'ica_allotaudit', 'http', NULL, 0);