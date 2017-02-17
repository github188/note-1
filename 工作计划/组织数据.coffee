
#根据配置来组织页面要渲染的数据，好像目前只需要校验需要编辑的列是不是有值，没有值用数据来源列给待编辑列赋值
exports.preparePackbarDatas = ()->
	options = this.model.attributes
	packbars = this.model.attributes.distData
	for fieldItem in options.editFields
		for packbar in packbar
			if not packbars[fieldItem.name]
				packbars[fieldItem.name] = packbars[fieldItem.dataFieldFrom] || 0
	return packbars

#返回待保存到数据[{'PACK_BAR':'',FIELDNAME1:'',FIELDNAME2:''...}]
exports.collectData = ()->
	rlt = []
	for $tr in $el.find('tbody tr')
		packbarData = {}
		packbar = $tr.attr 'field-data'
		packbarData.PACK_BAR = packbar
		for fieldItem in options.editFields
			fieldVal = ( $tr.find """input[field-name-data='#{fieldItem.name}']""" ).val()
			packbarData[fieldItem.name] = fieldVal
	return rlt