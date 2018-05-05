# 改完一个组件之后，快速改造其它组件

- imr 改用druid
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/conf/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/
	ps -ef | grep tomcat7-imr|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-imr-18101/bin/startup.sh

- dtp 改用druid
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/
	ps -ef | grep tomcat7-dtp|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-dtp-18100/bin/startup.sh


- base portal
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/lib/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/
	ps -ef | grep tomcat7-pub|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-pub-18082/bin/startup.sh

- imr 改用druid
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/conf/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/
	ps -ef | grep tomcat7-imr|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-imr-18101/bin/startup.sh

- bsp 改用druid
	cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-bsp-18081/webapps/bspr/WEB-INF/lib/
	ps -ef | grep tomcat7-bsp|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-bsp-18081/bin/startup.sh

- srr 改用druid
	cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-srr-18080/webapps/srr/WEB-INF/lib/
	\cp -f /opt/tomcat7-bsp-18081/webapps/bspr/WEB-INF/classes/datasource.props.xml /opt/tomcat7-srr-18080/webapps/srr/WEB-INF/classes/
	ps -ef | grep tomcat7-srr|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-srr-18080/bin/startup.sh

- bsp srr datasource.properties.xml修改
	<Property name="dataSource.connectionPool">druid</Property>
	<Property name="dataSource.driverClassName">org.gjt.mm.mysql.Driver</Property>
	<Property name="dataSource.url">jdbc:mysql://10.110.1.176:3306/v6db</Property>
	<Property name="dataSource.username">root</Property>
	<Property name="dataSource.password">root</Property>
	<Property name="dataSource.initialSize">1</Property>
	<Property name="dataSource.minIdle">1</Property>
	<Property name="dataSource.maxActive">20</Property>
	<Property name="dataSource.maxWait">60000</Property>
	<Property name="dataSource.timeBetweenEvictionRunsMillis">60000</Property>
	<Property name="dataSource.minEvictableIdleTimeMillis">300000</Property>
	<Property name="dataSource.filters">stat,log4j</Property>

	<filter>  
		<filter-name >DruidWebStatFilter</filter-name >  
		<filter-class >com.alibaba.druid.support.http.WebStatFilter</filter-class >  
		<init-param >  
			<param-name >exclusions</param-name >  
			<param-value >*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*</param-value >  
		</init-param >  
	</filter >  
	<filter-mapping >  
		<filter-name >DruidWebStatFilter</filter-name >  
		<url-pattern >/*</url-pattern >  
	</filter-mapping >  
	<servlet >  
		<servlet-name >DruidStatView</servlet-name >  
		<servlet-class >com.alibaba.druid.support.http.StatViewServlet</servlet-class >  
	</servlet >  
	<servlet-mapping >  
		<servlet-name >DruidStatView</servlet-name >  
		<url-pattern >/druid/* </url-pattern >  
	</servlet-mapping >