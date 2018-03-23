# druid 数据连接池

- 最近由于项目中遇到Tomcat+MySQL环境，需要改造SQL和程序，由于Tomcat默认的数据库连接池c3p0的一些限制，
	改用druid作为连接池管理工具，这里做了一些技术验证，记录一下。

- 首先下载druid的jar包，放到工程的lib目录下
- 配置DataSource
	<bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
		<property name="url" value="jdbc:mysql://10.110.1.176:3306/v6db"></property>
		<property name="username" value="root"></property>
		<property name="password" value="root"></property>
	</bean>
	<bean id="hdDataSource" class="com.alibaba.druid.pool.DruidDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
		<property name="url" value="jdbc:mysql://10.110.1.176:3306/v6db"></property>
		<property name="username" value="root"></property>
		<property name="password" value="root"></property>
	</bean>
- web.xml 添加配置
	<!-- 连接池 启用 Web 监控统计功能    start-->
	<filter>
		<filter-name>DruidWebStatFilter</filter-name>
		<filter-class>com.alibaba.druid.support.http.WebStatFilter</filter-class>
		<init-param>
			<param-name>exclusions</param-name>
			<param-value>*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>DruidWebStatFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	<servlet>
		<servlet-name>DruidStatView</servlet-name>
		<servlet-class>com.alibaba.druid.support.http.StatViewServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>DruidStatView</servlet-name>
		<url-pattern>/druid/*</url-pattern>
	</servlet-mapping>
	<!-- 连接池 启用 Web 监控统计功能    end-->

- http://localhost/ica/druid/index.html