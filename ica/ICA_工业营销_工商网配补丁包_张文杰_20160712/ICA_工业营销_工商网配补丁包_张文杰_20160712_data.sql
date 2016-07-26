UPDATE PUB_FUNCTIONS SET 
	ORGAN_TYPE='6701',STRU_TYPE='11'
WHERE
	FUNCTION_CODE IN('ica_distplan','ica_perdiem','ica_cotrackingQ','ica_disttracking','ica_realtimeplan','ica_warningplan','ica_dist_warning','ica_dsph_peihuojisuan','ica_com_manageF');