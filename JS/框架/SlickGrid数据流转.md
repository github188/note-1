#data作为SlickGrid的数据，其流转是表格的核心
##1、data在slickgrid.js中唯一使用方式是getDataItem
##2、appendRowHtml 渲染行DOM的时候，获取对应行号的数据
##3、appendCellHtml 渲染行中'TD'的时候，getDataItemValueForColumn(item, m)获取字段值，渲染逻辑……
##4、commitCurrentEdit 修改编辑的表格的值到data中，触发事件onCellChange

#修改数据的逻辑
##1、makeActiveCellEditable 渲染编辑DOM，载入item的值，设置当前活动编辑变量currentEditor
##2、setActiveCellInternal 通过这个函数