# druid 数据库连接池管理工具

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

	其它的一些配置
	<!-- 配置初始化大小、最小、最大 --> 
	<property name="initialSize" value="1" /> 
	<property name="minIdle" value="1" /> 
	<property name="maxActive" value="10" />
	<!-- 配置获取连接等待超时的时间 --> 
	<property name="maxWait" value="10000" />
	<!-- 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒 --> 
	<property name="timeBetweenEvictionRunsMillis" value="60000" />
	<!-- 配置一个连接在池中最小生存的时间，单位是毫秒 --> 
	<property name="minEvictableIdleTimeMillis" value="300000" />
	<property name="testWhileIdle" value="true" />

	<!-- 开启SQL监控 --> 
	<property name="filters" value="stat" /> 
	filters	属性类型是字符串，通过别名的方式配置扩展插件，常用的插件有： 
	监控统计用的filter:stat日志用的filter:log4j防御sql注入的filter:wall

- web.xml 添加配置
	<!-- 连接池 启用 Web 监控统计功能    start-->
	<filter>
		<filter-name>DruidWebStatFilter</filter-name>
		<filter-class>com.alibaba.druid.support.http.WebStatFilter</filter-class>
		<init-param>
			<param-name>exclusions</param-name>
			<param-value>*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*</param-value>
		</init-param>
		<init-param>
			<param-name>principalSessionName</param-name>
			<param-value>sessionInfo</param-value>
		</init-param>
		<init-param>
			<param-name>profileEnable</param-name>
			<param-value>true</param-value>
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

### 开启慢sql监控
-	在SQL监控中，有一项关于sql执行最慢执行时间的统计，但是只有一个值，就是一条sql语句最慢的执行时间记录，其他执行时间是看不到的，		只能通过总时间来进行粗略的估计，还有一个问题就是，一旦项目重启，这些记录就全都没了，因此制定对应的日志输出策略是极其必要的。
	大致想法就是通过druid获取所有项目运行中的慢sql执行记录，并将这些数据输出到日志文件中，查了一下druid的资料，调试了一段时间，最终成功实现。

- 修改数据源配置，增加拦截器：

	<property name="proxyFilters">
		<list>
			<ref bean="stat-filter"/>
			<ref bean="log-filter"/>
		</list>
	</property>
- 配置慢sql及日志拦截器：
	<!-- 慢SQL记录 -->
	<bean id="stat-filter" class="com.alibaba.druid.filter.stat.StatFilter">
		<!-- 慢sql时间设置,即执行时间大于200毫秒的都是慢sql -->
		<property name="slowSqlMillis" value="200"/>
		<property name="logSlowSql" value="true"/>
	</bean>

	<bean id="log-filter" class="com.alibaba.druid.filter.logging.Log4jFilter">
		<property name="dataSourceLogEnabled" value="true" />
		<property name="statementExecutableSqlLogEnable" value="true" />
	</bean>
- 修改log4j配置文件，增加慢sql日志的输出策略：
	log4j.rootLogger=DEBUG,debug,druid
	# Druid
	log4j.logger.druid.sql=WARN,druid
	log4j.logger.druid.sql.DataSource=WARN,druid
	log4j.logger.druid.sql.Connection=WARN,druid
	log4j.logger.druid.sql.Statement=WARN,druid

	log4j.appender.druid=org.apache.log4j.DailyRollingFileAppender
	log4j.appender.druid.layout=org.apache.log4j.PatternLayout
	log4j.appender.druid.layout.ConversionPattern= [%d{HH\:mm\:ss}] %c{1} - %m%n
	log4j.appender.druid.datePattern='.'yyyy-MM-dd
	log4j.appender.druid.Threshold = WARN
	log4j.appender.druid.append=true
	log4j.appender.druid.File=${catalina.home}/logs/ssm-maven/druid-slow-sql.log

### 开启spring监控 （V6未验证） http://www.cnblogs.com/telwanggs/p/7484854.html
- 在监控面板中看到有spring监控这个功能
	配置如下：
	<bean id="druid-stat-interceptor"
		class="com.alibaba.druid.support.spring.stat.DruidStatInterceptor">
	</bean>

	<bean id="druid-stat-pointcut" class="org.springframework.aop.support.JdkRegexpMethodPointcut"
		scope="prototype">
		<property name="patterns">
			<list>
				<value>com.ssm.maven.core.service.*</value>
				<value>com.ssm.maven.core.dao.*</value>
			</list>
		</property>
	</bean>

	<aop:config>
		<aop:advisor advice-ref="druid-stat-interceptor" pointcut-ref="druid-stat-pointcut"/>
	</aop:config>