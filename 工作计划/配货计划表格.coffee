$ = require 'jquery'
_ = require 'lodash'
Backbone = require 'backbone'

#param options
#options.$el: 表格的css选择器
#options.distPk：配货的业务主键
#options.showFields:[FIELDNAME,FIELDNAME] 待显示的字段
#options.editFields:[{name:'FIELDNAME',dataFieldFrom:'FIELDNAME'}] 待编辑的字段,数据来源,
#	如果待编辑的字段有值，取待编辑字段值，否则取数据来源的值 明细页面不需要配置该字段
#-------------------------------------------- 
# 使用方式
# var view = null
# new DistTable( options ).done( function( v ){
#	view = v
# }).fail( function(){
#	console.log('程序出问题了！')
# })
# var datas = view.getDatas()

window.DistTable = ( options )->
	#Backbone View不能传JQuery对象，要转成最初的选择器
	if options.$el.selector
		options.$el = options.$el.selector
	view = null
	d = $.Deferred()
	ServiceUtils.getDistDataByPk( options.distPk )
		.done ( data )->
			if data.ok
				distData = data.data
				mod = new Backbone.Model( $.extends({}, options, {distData:distData} ) )
				view = new DistTableView( model:mod, el:options.el||options.$el )
				d.resolve view
			else
				jAlert '获取数据失败！'
				console.log ( '获取数据失败原因 msg = ' + data.msg ) if console?
				d.reject()
		.fail ()->
			jAlert '获取数据失败！'
	return d

DistTableView = Backbone.View.extend
	#初始化
	initialize:( options )->
		this.renderTitle()
		this.renderTable()
	
	# Cache the template function for a single item.
	template: _.template( $('#title-template').html() )

	#渲染页面明细部分，这块与具体业务相关，可以用html模板实现
	renderTitle:()->
		return this.template( this.model.get( distData ) )

	renderTable:()->
		packbars = DistUtils.preparePackbarDatas.apply this
		return RenderUtils.renderTable.apply( this, [ packbars ] )

	#返回待保存到数据[{'PACK_BAR':'',FIELDNAME1:'',FIELDNAME2:''...}]
	getDatas:()->
		DistUtils.collectData.apply( this )

	#校验所有的待编辑字段是否与对应的dataFieldFrom字段一致 返回true|false
	hasChanged:()->
