

INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ICA_DIST_TYPE', '90', '第三方对接', '配货类型');


INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '10', '制定', '状态');
INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '11', '审核', '状态');
INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '12', '审核通过', '状态');
INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '13', '活动安排', '状态');
INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '14', '数据提取', '状态');
INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ONLINE_INVEST_STATUS', '15', '活动分析', '状态');

INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('icm_onlineinvest', '在线调查', 'icm_task', 4, '6705', '1', '/task/onlineinvest.cmd?method=main', '', '0', NULL, 1001, NULL, '11');

INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('icm_onlineinvestQ', '在线调查', 'icm_onlineinvest', '00', '1', 0);

INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee81505a17e340015aa14db9f30066', '在线调查', '/task/onlineinvest.cmd?method=main', 'icm_onlineinvestQ', 'icm_onlineinvest', 'http', NULL, 0);