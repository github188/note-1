--菜单路径
    --：工商协同-工商协同-商业投放策略查询


INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('ica_tacticquery', '商业投放策略查询', 'ica_collaboration', 3, '6701', '1', '/collaboration/tacticonly_query_init.cmd', '', '0', NULL, 1001, NULL, '11');


INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('ica_tacticqueryQ', '查询', 'ica_tacticquery', '00', '1', 0);


INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff9720159060161bf0020', '查询', '/collaboration/tacticonly_query_init.cmd', 'ica_tacticqueryQ', 'ica_tacticquery', 'http', NULL, 0);
