
INSERT INTO PUB_FUNCTIONS
(FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ, ORGAN_TYPE, IS_MENU, URL, ICON, F_TYPE, TARGET, CP_MENU_ID, DESCRIPTION, STRU_TYPE)
VALUES('icm_disttrack', '计划跟踪', 'ICM_PART', 26, '1011', '1', '/netdist/icmdisttrack/icmdisttrack.cmd?method=distTrack', '', '0', NULL, 1001, NULL, '02');



INSERT INTO PUB_OPERATIONS
(OPERATION_CODE, OPERATION_NAME, FUNCTION_CODE, OPERATION_TYPE_CODE, IS_DEFAULT, SEQ)
VALUES('icm_disttrackQ', '计划跟踪', 'icm_disttrack', '00', '1', 0);



INSERT INTO PUB_URLS
(URL_CODE, URL_NAME, URL_CONTENT, OPERATION_CODE, FUNCTION_CODE, ACCESS_TYPE, NOTE, SEQ)
VALUES('80808157077ba20157b78d9f180416', '计划跟踪', '/netdist/icmdisttrack/icmdisttrack.cmd?method=distTrack', 'icm_disttrackQ', 'icm_disttrack', 'http', NULL, 0);
