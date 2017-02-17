INSERT INTO PUB_MODULES
(MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ, IS_MENU, URL, ICON, TARGET)
VALUES('icm_reports', '报表', '-1', '1', 'icm', 'icm_reports', '报表', 4, '1', '', '', NULL);

INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('icm_monthfore_reports', '月度预测结果查询', 'icm_reports', 0, '6701', '1', '/reports/comfore.cmd?method=monthComsFore', '', '0', NULL, 1001, NULL, '11');
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('icm_halfyear_reprots', '半年预测结果查询', 'icm_reports', 0, '6701', '1', '/reports/comfore.cmd?method=halfYearComsFore', '', '0', NULL, 1001, NULL, '11');

INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('icm_monthfore_reportsQ', '查询', 'icm_monthfore_reports', '00', '1', 0);
INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('icm_halfyear_reportsQ', '报表查询', 'icm_halfyear_reprots', '00', '1', 0);

INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff972015a02df0e63009f', '查询', '/reports/comfore.cmd?method=monthComsFore', 'icm_monthfore_reportsQ', 'icm_monthfore_reports', 'http', NULL, 0);
INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff972015a02dd9680009e', '报表查询', '/reports/comfore.cmd?method=halfYearComsFore', 'icm_halfyear_reportsQ', 'icm_halfyear_reprots', 'http', NULL, 0);