
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('imr_basic_timeanalysis', '基本指标分析-时间', 'imr_pc', 16, '6705', '1', '/pc/basicanalysis.cmd?method=timeanalysis', '', '0', NULL, 1001, NULL, '11');
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('imr_basic_cgt', '基本指标分析-卷烟', 'imr_pc', 0, '6705', '1', '/pc/basicanalysis.cmd?method=cgtanalysis', '', '0', NULL, 1001, NULL, '11');
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('imr_basic_areaanalysis', '基本指标分析-区域', 'imr_pc', 15, '6705', '1', '/pc/basicanalysis.cmd?method=areaanalysis', '', '0', NULL, 1001, NULL, '11');


INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('imr_basic_timeanalysisQ', '查询', 'imr_basic_timeanalysis', '00', '1', 0);
INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('imr_basic_cgtQ', '查询', 'imr_basic_cgt', '00', '1', 0);
INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('imr_basic_areaQ', '查询', 'imr_basic_areaanalysis', '00', '1', 0);



INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff9720158fb30d405000f', '查询', '/pc/basicanalysis.cmd?method=timeanalysis', 'imr_basic_timeanalysisQ', 'imr_basic_timeanalysis', 'http', NULL, 0);
INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff9720158fb2f3c7c000e', '查询', '/pc/basicanalysis.cmd?method=cgtanalysis', 'imr_basic_cgtQ', 'imr_basic_cgt', 'http', NULL, 0);
INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff9720158fb2b7434000d', '查询', '/pc/basicanalysis.cmd?method=areaanalysis', 'imr_basic_areaQ', 'imr_basic_areaanalysis', 'http', NULL, 0);
