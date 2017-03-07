INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('cotracking', '配货跟踪', 'ica_dist', 99, '6705', '1', '/dist/disttracking/disttracking_query_init.cmd', '', '0', NULL, 1001, NULL, '11');

INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('cotracking_query', '查询', 'cotracking', '00', '1', 99);

INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee81505a17e340015a63da7766002a', '查询', '/dist/disttracking/disttracking_query_init.cmd', 'cotracking_query', 'cotracking', 'http', NULL, 0);