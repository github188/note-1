# cmd --》被spring框架管理的java类，实现MVC中的controller，被前端分发器所调用，并返回jsp的相对路径。


# V6需要继承的cmd主要有以下三种
- BaseCommandImpl 基础类，新增，修改，明细，校验等逻辑，不分页的数据查询
- QueryCommandImpl 分页查询
- QueryCommandNoPageImpl 不分页查询 //略，使用率极低，掌握分页的cmd就会使用不分页的cmd


## QueryCommandImpl 分页查询
### 实现分页查询要继承该类，提供了后台分页，字典缓存等功能
### public String query(HttpServletRequest req,HttpServletResponse rep,
					QueryHelper helper,Map map) throws Exception
继承该类要实现该类query方法，参数分别为 http请求 http响应 帮助类 map对象
分页查询，前台查询等参数需要调用以下代码传递到map中 map=getQueryParam(req,helper,map);
其中查询参数以Search结尾的则会被放到session中，直到过时才会被清理

### 一般分页查询需要提供排序功能，排寻传到后台的参数需要处理
	map.put( "sortName", req.getParameter( "_sortname" ) );
	map.put( "sortType", req.getParameter( "_sorttype" ) );
### 对于一般的查询参数，步骤b已经组装完所有的查询参数，但存在多选的查询条件，需要额外处理，多选传递的参数是把值用逗号分割开来
	String statusSearch = ( String )req.getSession().getAttribute( "statusSearch" );
	if( statusSearch != null && !"".equals( statusSearch ) ){
		String[] statusArr = statusSearch.split( "," );
		map.put( "statusArr", statusArr );
	}
### 查询需要限制数据权限，否则会让客户看到他们不需要看到或者本没有权限看到的数据
	Set slsmanPermit = V6BspInfo.getUserOrganDataPermit(); //获取登录用户默认的数据权限
	map.put( "slsmanPermit", slsmanPermit );
	
### 查询完毕后要把数据返回到前端jsp
	req.setAttribute( "flexgriddata", data ); //data是查询结果
	helper.setPage( allCom ); //allCom是分页信息
	//对于数据表中存放的是枚举值的需要根据字典表进行转换，或者查询条件为枚举值的也要使用字典，这样当枚举改变时不用修改程序
	setListCache( "statusList", CacheConstants.BASE_DICT_CACHE_KEY, "ICA_COM_STATUS" ); 
	
### 分页查询cmd在spring的配置应该是
	<!--***** query command configuration *****-->
	<bean id="com_query_init" class="com.v6.ica.basic.com.ComQueryPageInitCmd">
		<property name="comService"><ref bean="comService"/></property>
		<property name="forwards">
			<map>
				<entry key="query" value="com/com_query_init.jsp" />
			</map>
		</property>
		<property name="pageSize"><value>10</value></property>
	</bean>
	其中配置的跳转路径是相对路径，其前缀是modules.properties 中配置的 viewPath属性
	
	
## BaseCommandImpl 基础类
### 实现增删改查要继承该类，字典缓存，表单转换等功能
### 没有必须要实现的方法，所有要跳转的方法都要有 http请求 http响应 errorHandler messageHandler viewHelper 5个参数
	public String insert(HttpServletRequest req, HttpServletResponse rep,
			IErrorHandler errorHandler, IMessageHandler messageHandler,
			ViewHelper viewHelper) {
		if (log.isInfoEnabled()) {
			log.info("ComCmd.insert--begin"); //注意日志级别 info
		}
		
		//取得form表单信息
		Map viewin=(Map)viewHelper.getView();
		
		viewHelper.setView( getComService().insertCom( viewin ) ); //调用服务层的接口做业务逻辑操作

		if (log.isInfoEnabled()) {
			log.info("ComCmd.insert--end");
		}
		return null;
	}
### 如果方法返回值为字符串，会找相应路径的jsp并返回；如果方法范围值为null，则会查找conf配置中为方法配置的返回的jsp路径；如果conf下也没有配置，则不进行返回;
	返回json串，是最后一种情况。
### 基础cmd在spring的配置应该是
<!--***** base command configuration *****-->
	<bean id="com" class="com.v6.ica.basic.com.ComCmd" singleton="false">
		<property name="comService"><ref bean="comService"/></property>
		<property name="forwards">
			<map>
				<entry key="forinsert" value="com/com_forinsert.jsp" />
				<entry key="forupdate" value="com/com_forupdate.jsp" />
				<entry key="fordetail" value="com/com_fordetail.jsp" />
				<entry key="insert" value="redirect:com_query_init.cmd" />
				<entry key="update" value="redirect:com_query_init.cmd" />
				<entry key="delete" value="redirect:com_query_init.cmd" /> //避免刷新页面报错
			</map>
		</property>
	</bean>