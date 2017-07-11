# app --》 V6中的一个组件，单独部署，不可随便添加，如有新增的需要，要发申请审批

## app文件目录
	app
		$war
			jsp //存放jsp
				com
					v6
						layout //布局 公共 头部
							default.jsp //所有没有配置对应jsp默认要找的jsp，组合在一起返回到客户端
						screen //业务逻辑页面，最终与layout一起返回到客户端
			WEB-INF
				classes //由源码目录编译生成
					com //生成的class
					metadata //单点登录相关配置文件
					configuration.xml //mybatis顶级配置文件
					log4j.properties //日志配置文件
					modules.properties //模块配置文件，新增模块时需要修改
					service.properties //高速服务配置文件
				conf
					app-name //应用模块java类spring配置，与跳转相关
					applicationsContext.xml //spring顶级配置
					jdbcSupport.xml //配置数据源连接
				web.xml //服务器依据该文件启动应用，应用的核心配置文件
		java //源码
			src
				com //java源码
				metadata //单点登录相关配置文件
				configuration.xml //mybatis顶级配置文件
				log4j.properties //日志配置文件
				modules.properties //模块配置文件，新增模块时需要修改
				service.properties //高速服务配置文件