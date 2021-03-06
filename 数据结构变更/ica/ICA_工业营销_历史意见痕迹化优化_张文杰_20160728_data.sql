DELETE FROM BASE_DICT WHERE DICT_ID='ICA_DIST_PLAN_STATUS' AND DICT_KEY IN ('07','08','09');

INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ICA_DIST_PLAN_STATUS', '07', '部分审核有未通过', '计划状态');

INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ICA_DIST_PLAN_STATUS', '08', '部分审核全通过', '计划状态');

INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ICA_DIST_PLAN_STATUS', '09', '全部审核有未通过', '计划状态');

INSERT INTO BASE_DICT
(DICT_ID, DICT_KEY, DICT_VALUE, DICT_DESC)
VALUES('ICA_DIST_PLAN_STATUS', '10', '全部通过', '计划状态');