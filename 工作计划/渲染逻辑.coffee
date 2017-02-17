_ = require 'lodash'
_distFields = ( require 'constance' ).DIST_FIELDS
_textFields = ( require 'constance' ).TEXT_FIELDS

#渲染表格逻辑
exports.renderTable = ()->
	options = this.model.attributes
	packbars = this.model.attributes.distData

	#渲染表头
	renderThead = ()->
		thead = ''
		thead += """<th>#{_distFields[fieldTmp]}</th>""" for fieldTmp in options.showFields
		return """<thead><tr>#{thead}</tr></thead>"""

	#渲染表格
	renderTbody = ()->
		tbody = '<tbody>'
		for packbar in packbars
			tbody += '<tr field-data="#{packbar.PACK_BAR}">'
			align = 'alignRight'
			for fieldTmp in options.showFields
				if ( _.findIndex _textFields,( d )->return d is fieldTmp ) isnt -1
					align = 'alignLeft'
				if ( _.findIndex options.editFields,( d )->return d.name is fieldTmp ) isnt -1
					tbody += 
						"""
							<td class="#{align}">
								<input type="text" field-name-data="#{fieldTmp}" class="#{align}" value="#{packbar[fieldTmp]}" />
							</td>
						"""
				else
					tbody += """<td class="#{align}">#{packbar[fieldTmp]}</td>"""
			tbody += '</tr>'
		tbody += '</tbody>'
		return tbody

	this.$el.html ( renderThead() + renderTbody() )
		.addClass 'flexigrid-dist'