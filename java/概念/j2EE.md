#跳转的问题
##请求是被servlet接受并转发的，转发的方式是dispitcher？
##不管是struts2还是springMvc最终返回的都是一个jsp路径，对应的这个jsp被容器解析为servlet并返回对应的html内容。
##struts2和springMVC都只是一个用来处理业务逻辑的中间层，用来简化开发与维护的工作。

#框架实现方式
##servlet的doService方法中，调用第三方框架来处理业务，然后根据第三方框架返回的jsp路径重定向。调用方式多是反射调用。

#v6的实现方式

##前台分发器是org.loushang.waf.mvc.ServletDispatcher ( loushang3.0-core.jar ) 其service方法加密不可读

##CommandSupport是分页和跳转的cmd所继承的基类，其调用模板方法String s = doExecute();来执行业务逻辑并接受要返回的jsp路径。相关的类
###org.loushang.module.Module 这个类存放的是应用下的配置的模块，其初始化的时候初始化了类静态属性contextModules，在这个map中存放了所有的模块对象
###org.loushang.waf.mvc.CommandSupportSmart对CommandSupport类的扩展，其doForward函数通过url中的模块值获取Module.contextModules获取module，组织jsp路径