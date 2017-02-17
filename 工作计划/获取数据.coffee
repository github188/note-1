exports.getDistDataByPk = ( distPk )->
	return $.ajax
		url:'/ica/dist.cmd?method=getDistDataByPk'
		data:{primaryKey:distPk}
		type:'GET'
		dataType:'json'