# css --》 V6的样式符合一些约定的规范

## 查询条件一行三个，如果不足三个，可以少于三个，但不能多于三个
## 表格内容如果是数字，居右对齐，是不等长的字符串，居左对齐，等长的字符串，居中对齐
## 当查询条件只有一个的时候，查询按钮应紧跟查询条件；当查询条件多余一个时，查询按钮浮动到查询区域右边
## 不同的表格样式
queryTable 查询条件区域表格
flexigrid 分页查询|不分页查询展示数据表格
editgrid 主从表中的从表编辑表格
detailTable 明细页面展示数据表格
insertTable 编辑页面的数据表格
其中queryTabl detailTabl insertTable 都使用样式 queryLabelTd 作为标签 queryCaseTd 作为内容