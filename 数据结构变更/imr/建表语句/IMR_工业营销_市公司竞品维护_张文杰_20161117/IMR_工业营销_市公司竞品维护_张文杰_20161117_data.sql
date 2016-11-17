INSERT INTO PUB_MODULES
(MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ, IS_MENU, URL, ICON, TARGET)
VALUES('imr_manager', '后台管理', '-1', '1', 'imr', 'imr_manager', '后台管理', 1, '1', '', '', NULL);

INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('imr_itemcompete', '竟品维护', 'imr_manager', 0, '26111', '1', '/pc/itemcompete.cmd?method=itemCompeteManager', '', '0', NULL, 1001, NULL, '11');

INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('imr_itemcompeteQ', '竟品维护', 'imr_itemcompete', '00', '1', 0);

INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('ee8150586ff97201586ff9728b0000', '竟品维护', '/pc/itemcompete.cmd?method=itemCompeteManager', 'imr_itemcompeteQ', 'imr_itemcompete', 'http', NULL, 0);