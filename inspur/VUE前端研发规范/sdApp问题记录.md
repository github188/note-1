## 为了做出一个让自己满意的东西，还需要做以下的东西

- user页面，子路由设置 修改user.vue文件
- 移除拜访户增加提醒，确认后再移除，防止误操作
- 详情页面滚动IPHONE有问题，onscroll事件对iPhone有缺陷，需要增加touchmove事件监听

- 零售户查询页面路由跳转到零售户详情路由跳转两次问题（搜索代码哪里处理路由跳转了）
- 原始坐标偏转为百度坐标问题 （后续表里增加字段，批量处理）
- 百度SDK定位问题（技术架构部捣鼓去了）

- 待优化（代码重构）
	子路由页面覆盖不要使用fixed布局实现，影响页面布局，尤其是依赖滚动的页面
	修改代码样式乱七八糟的变量定义，给变量名取好注释
	全局事件传递采用Vue $emit $on机制
	代码中不要watch大对象，占用内存是个大坑