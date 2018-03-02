# modules --》 应用中根据业务划分的模块，增加模块相对于增加app没有那么严格，小组内相关人员讨论即可增加

# 模块的定义配置是在 /appname/java/src/modules.properties文件中
- app.code=appname //应用名，不要更改

- //以下为定义一个名为basic的模块的示例
- basic.context=basic //模块名称
- basic.viewPath=/jsp/com/v6/screen/ica/basic //模块jsp路径
- basic.package=com.v6.ica.basic //模块java路径
- basic.allowCache=false //是否使用缓存

- 如果某模块前端jsp需要做个性化的操作，切影响范围是整个模块的jsp，可以在/ica/$war/jsp/com/v6/layout/appname
- 路径下增加名为模块名的文件夹并新增default.jsp文件，则返回客户端的内容是与新增的jsp组装的内容。